# Setup New Project Script
# This script renames all "ProjectName" placeholders to your actual project name

param(
	[Parameter(Mandatory=$true, HelpMessage="Enter your project name (e.g., 'DreamBuilderMCP')")]
	[ValidateNotNullOrEmpty()]
	[string]$ProjectName
)

Write-Host "`n🏗️  DreamBuilders Project Setup" -ForegroundColor Cyan
Write-Host "=" * 70 -ForegroundColor Gray

# Validate project name (alphanumeric and basic characters only)
if ($ProjectName -notmatch '^[a-zA-Z][a-zA-Z0-9._-]*$') {
	Write-Host "❌ Error: Project name must start with a letter and contain only letters, numbers, dots, hyphens, and underscores." -ForegroundColor Red
	exit 1
}

Write-Host "`nProject Name: $ProjectName" -ForegroundColor White
Write-Host ""

# Confirm with user
$confirm = Read-Host "This will rename all 'ProjectName' references. Continue? (y/n)"
if ($confirm -ne 'y' -and $confirm -ne 'Y') {
	Write-Host "`n❌ Setup cancelled." -ForegroundColor Yellow
	exit 0
}

Write-Host "`n📝 Step 1: Renaming content in files..." -ForegroundColor Yellow

# Get all text files (exclude binary and obj/bin folders)
$files = Get-ChildItem -Recurse -File | 
	Where-Object { 
		$_.Extension -match '\.(cs|csproj|sln|md|txt|json|yml|yaml|xml|props|config|ps1)$' -and
		$_.FullName -notmatch '\\(obj|bin)\\' -and
		$_.Name -ne 'setup-new-project.ps1'
	}

$filesUpdated = 0
foreach ($file in $files) {
	try {
		$content = Get-Content $file.FullName -Raw -ErrorAction Stop
		if ($content -match 'ProjectName') {
			$newContent = $content -replace 'ProjectName', $ProjectName
			Set-Content $file.FullName -Value $newContent -NoNewline
			Write-Host "  ✅ Updated: $($file.FullName.Replace($PWD.Path, '.'))" -ForegroundColor Green
			$filesUpdated++
		}
	}
	catch {
		Write-Host "  ⚠️  Skipped (error): $($file.FullName)" -ForegroundColor Yellow
	}
}

Write-Host "`n  📊 Files updated: $filesUpdated" -ForegroundColor Cyan

Write-Host "`n📝 Step 2: Renaming files and folders..." -ForegroundColor Yellow

# Rename files (bottom-up to avoid path issues)
$filesToRename = Get-ChildItem -Recurse -File | 
	Where-Object { $_.Name -match 'ProjectName' -and $_.FullName -notmatch '\\(obj|bin)\\' } |
	Sort-Object -Property FullName -Descending

$filesRenamed = 0
foreach ($file in $filesToRename) {
	try {
		$newName = $file.Name -replace 'ProjectName', $ProjectName
		$newPath = Join-Path $file.DirectoryName $newName
		Move-Item $file.FullName $newPath -Force
		Write-Host "  ✅ Renamed file: $($file.Name) → $newName" -ForegroundColor Green
		$filesRenamed++
	}
	catch {
		Write-Host "  ⚠️  Failed to rename: $($file.Name)" -ForegroundColor Yellow
	}
}

# Rename directories (bottom-up to avoid path issues)
$foldersToRename = Get-ChildItem -Recurse -Directory | 
	Where-Object { $_.Name -match 'ProjectName' -and $_.FullName -notmatch '\\(obj|bin)\\' } |
	Sort-Object -Property FullName -Descending

$foldersRenamed = 0
foreach ($folder in $foldersToRename) {
	try {
		$newName = $folder.Name -replace 'ProjectName', $ProjectName
		$newPath = Join-Path $folder.Parent.FullName $newName
		Move-Item $folder.FullName $newPath -Force
		Write-Host "  ✅ Renamed folder: $($folder.Name) → $newName" -ForegroundColor Green
		$foldersRenamed++
	}
	catch {
		Write-Host "  ⚠️  Failed to rename folder: $($folder.Name)" -ForegroundColor Yellow
	}
}

Write-Host "`n  📊 Files renamed: $filesRenamed" -ForegroundColor Cyan
Write-Host "  📊 Folders renamed: $foldersRenamed" -ForegroundColor Cyan

Write-Host "`n📝 Step 3: Updating dreams/README.md with project vision..." -ForegroundColor Yellow

$dreamsReadme = "dreams\README.md"
if (Test-Path $dreamsReadme) {
	$content = Get-Content $dreamsReadme -Raw

	# Update the project vision placeholder
	$visionPlaceholder = "**Project Vision:** [Add one-sentence vision statement]"
	$newVision = "**Project Vision:** $ProjectName - [Add your vision statement here]"
	$content = $content -replace [regex]::Escape($visionPlaceholder), $newVision

	# Update current phase
	$phasePlaceholder = "**Current Phase:** [Discovery | Planning | Execution | Maintenance]"
	$newPhase = "**Current Phase:** Discovery"
	$content = $content -replace [regex]::Escape($phasePlaceholder), $newPhase

	# Update last updated date
	$datePlaceholder = "**Last Updated:** [Date]"
	$newDate = "**Last Updated:** $(Get-Date -Format 'yyyy-MM-dd')"
	$content = $content -replace [regex]::Escape($datePlaceholder), $newDate

	Set-Content $dreamsReadme -Value $content -NoNewline
	Write-Host "  ✅ Updated dreams/README.md" -ForegroundColor Green
}

Write-Host "`n📝 Step 4: Cleaning up build artifacts..." -ForegroundColor Yellow

# Clean obj/bin folders from template
$cleanFolders = Get-ChildItem -Recurse -Directory | Where-Object { $_.Name -eq 'obj' -or $_.Name -eq 'bin' }
foreach ($folder in $cleanFolders) {
	Remove-Item $folder.FullName -Recurse -Force -ErrorAction SilentlyContinue
	Write-Host "  ✅ Removed: $($folder.FullName.Replace($PWD.Path, '.'))" -ForegroundColor Green
}

Write-Host "`n📝 Step 5: Verifying solution..." -ForegroundColor Yellow

$solutionFile = Get-ChildItem -Filter "*.sln*" | Select-Object -First 1
if ($solutionFile)
{
	Write-Host "  ✅ Solution file: $($solutionFile.Name)" -ForegroundColor Green

	# Try to build
	Write-Host "`n  🔨 Building solution..." -ForegroundColor Cyan
	$buildResult = & dotnet build $solutionFile.FullName 2>&1
	if ($LASTEXITCODE -eq 0)
	{
		Write-Host "  ✅ Build successful!" -ForegroundColor Green
	}
	else
	{
		Write-Host "  ⚠️  Build had warnings/errors (review output above)" -ForegroundColor Yellow
	}
}
else
{
	Write-Host "  ⚠️  No solution file found" -ForegroundColor Yellow
}

Write-Host "`n" + ("=" * 70) -ForegroundColor Gray
Write-Host "✅ Setup Complete!" -ForegroundColor Green
Write-Host ""

Write-Host "📋 Summary:" -ForegroundColor Cyan
Write-Host "  • Project Name: $ProjectName" -ForegroundColor White
Write-Host "  • Files Updated: $filesUpdated" -ForegroundColor White
Write-Host "  • Files Renamed: $filesRenamed" -ForegroundColor White
Write-Host "  • Folders Renamed: $foldersRenamed" -ForegroundColor White

Write-Host "`n📚 Next Steps:" -ForegroundColor Cyan
Write-Host "  1. Review dreams/README.md and add your vision" -ForegroundColor Gray
Write-Host "  2. Add specifications to dreams/specifications/" -ForegroundColor Gray
Write-Host "  3. Update README.md with project details" -ForegroundColor Gray
Write-Host "  4. Run: dotnet build $($solutionFile.Name)" -ForegroundColor Gray
Write-Host "  5. Run: dotnet test" -ForegroundColor Gray
Write-Host "  6. Start coding following the 4-phase workflow!" -ForegroundColor Gray

Write-Host "`n🔗 Workflow Reference:" -ForegroundColor Cyan
Write-Host "  • Read: copilot-instructions.md" -ForegroundColor Gray
Write-Host "  • Read: GETTING_STARTED.md" -ForegroundColor Gray
Write-Host "  • Org workflow: https://github.com/DreamBuildersGuild/.github" -ForegroundColor Gray

Write-Host "`n💡 Optional: Remove this setup script" -ForegroundColor Yellow
Write-Host "  Run: Remove-Item setup-new-project.ps1" -ForegroundColor Gray

Write-Host "`n🎉 Happy coding! 🏗️" -ForegroundColor Cyan
Write-Host ""
