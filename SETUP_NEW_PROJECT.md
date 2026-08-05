# Setup New Project from Template

This guide explains how to create a new project from the DreamBuilders-Project-Template.

## Quick Start (3 Steps)

### 1️⃣ Create from Template on GitHub

1. Go to https://github.com/DreamBuildersGuild/DreamBuilders-Project-Template
2. Click the green **"Use this template"** button
3. Click **"Create a new repository"**
4. Fill in:
   - **Repository name**: Your project name (e.g., `DreamBuilderMCP`)
   - **Description**: Brief description of your project
   - **Visibility**: Public or Private
5. Click **"Create repository"**
6. Clone your new repository locally

### 2️⃣ Rename Project Files

Use your IDE's **Find and Replace** feature:

**Visual Studio:**
1. Open solution in Visual Studio
2. Press `Ctrl+Shift+H` (Replace in Files)
3. Find: `ProjectName`
4. Replace: `YourProjectName` (e.g., `DreamBuilderMCP`)
5. Click "Replace All"

**VS Code:**
1. Press `Ctrl+Shift+H`
2. Find: `ProjectName`
3. Replace: `YourProjectName`
4. Click "Replace All"

**Command Line (PowerShell):**
```powershell
# Navigate to your project directory
cd C:\path\to\your\project

# Replace in all files
Get-ChildItem -Recurse -File | Where-Object {
	$_.Extension -match '\.(cs|csproj|sln|slnx|md|txt|json|yml|yaml|xml|props)$' -and
	$_.FullName -notmatch '\\(obj|bin)\\'
} | ForEach-Object {
	$content = Get-Content $_.FullName -Raw
	if ($content -match 'ProjectName') {
		$content -replace 'ProjectName', 'YourProjectName' | Set-Content $_.FullName -NoNewline
		Write-Host "Updated: $($_.Name)"
	}
}
```

### 3️⃣ Rename Files and Folders

**Manually rename these items** (or use your IDE's rename refactoring):

- `ProjectName.slnx` → `YourProjectName.slnx`
- `src/ProjectName/` → `src/YourProjectName/`
- `src/ProjectName/ProjectName.csproj` → `src/YourProjectName/YourProjectName.csproj`
- `tests/ProjectName.Tests/` → `tests/YourProjectName.Tests/`
- `tests/ProjectName.Tests/ProjectName.Tests.csproj` → `tests/YourProjectName.Tests/YourProjectName.Tests.csproj`

**PowerShell (automated):**
```powershell
# Rename files
Get-ChildItem -Recurse -File | Where-Object { $_.Name -match 'ProjectName' } | 
	Sort-Object -Property FullName -Descending | ForEach-Object {
	$newName = $_.Name -replace 'ProjectName', 'YourProjectName'
	Rename-Item $_.FullName $newName
	Write-Host "Renamed: $($_.Name) → $newName"
}

# Rename folders
Get-ChildItem -Recurse -Directory | Where-Object { $_.Name -match 'ProjectName' } | 
	Sort-Object -Property FullName -Descending | ForEach-Object {
	$newName = $_.Name -replace 'ProjectName', 'YourProjectName'
	Rename-Item $_.FullName $newName
	Write-Host "Renamed folder: $($_.Name) → $newName"
}
```

## Verify Setup

```powershell
# Build the solution
dotnet build

# Run tests
dotnet test

# Check for any remaining "ProjectName" references
Get-ChildItem -Recurse -File | Where-Object {
	$_.Extension -match '\.(cs|csproj|sln|slnx|md)$'
} | Select-String -Pattern "ProjectName" -List
```

## Update Project Vision

Edit `dreams/README.md` and update:
- **Project Vision**: Add your one-sentence vision statement
- **Current Phase**: Set to "Discovery"
- **Last Updated**: Set to today's date

## Next Steps

1. ✅ Review `README.md` and update with your project details
2. ✅ Read `GETTING_STARTED.md` for development workflow
3. ✅ Read `copilot-instructions.md` for AI coding guidelines
4. ✅ Add your initial requirements to `dreams/specifications/`
5. ✅ Commit and push your changes
6. ✅ Start coding following the 4-phase workflow!

## 🔗 Resources

- **Org Workflow**: https://github.com/DreamBuildersGuild/.github
- **Template Repository**: https://github.com/DreamBuildersGuild/DreamBuilders-Project-Template
- **Getting Started**: See `GETTING_STARTED.md` in your project

---

**🎉 You're ready to start building!**
