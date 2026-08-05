# Getting Started with ProjectName

Complete guide to set up and start developing with **ProjectName**.

---

## 📋 Table of Contents

1. [Prerequisites](#prerequisites)
2. [Installation](#installation)
3. [Understanding the Project](#understanding-the-project)
4. [Your First Contribution](#your-first-contribution)
5. [Development Workflow](#development-workflow)
6. [Common Tasks](#common-tasks)
7. [Troubleshooting](#troubleshooting)

---

## Prerequisites

### Required
- **.NET 10 SDK** - [Download](https://dotnet.microsoft.com/download/dotnet/10.0)
- **Git** - [Download](https://git-scm.com/downloads)
- **Code Editor**:
  - Visual Studio 2026 (recommended)
  - Visual Studio Code
  - JetBrains Rider

### Recommended
- **GitHub Copilot** - For workflow integration
- **PowerShell** - For automation scripts (Windows: built-in, Mac/Linux: [Install](https://learn.microsoft.com/powershell/scripting/install/installing-powershell))

### Verify Installation

```powershell
# Check .NET version
dotnet --version
# Should show 10.x.x or higher

# Check Git
git --version

# Check PowerShell (if using scripts)
$PSVersionTable.PSVersion
```

---

## Installation

### 1. Clone the Repository

```powershell
git clone https://github.com/DreamBuildersGuild/ProjectName.git
cd ProjectName
```

### 2. Restore Dependencies

```powershell
dotnet restore
```

### 3. Build the Solution

```powershell
dotnet build
```

**Expected output:**
```
Build succeeded.
	0 Warning(s)
	0 Error(s)
```

### 4. Run Tests

```powershell
dotnet test
```

**Expected output:**
```
Passed!  - Failed:     0, Passed:     X, Skipped:     0, Total:     X
```

---

## Understanding the Project

### Folder Structure

```
ProjectName/
├── dreams/              💭 START HERE!
│   ├── README.md        Overview of requirements
│   ├── specifications/  Detailed specs
│   ├── examples/        Reference examples
│   ├── research/        Research notes
│   └── decisions/       Architecture decisions (ADRs)
│
├── src/
│   └── ProjectName/     Main application code
│
├── tests/
│   └── ProjectName.Tests/  Unit tests
│
└── docs/                Generated documentation
```

### Key Files

- **dreams/README.md** - **Read this first!** Requirements and vision
- **copilot-instructions.md** - Workflow rules for this project
- **README.md** - Project overview (you're here!)
- **GETTING_STARTED.md** - This guide
- **setup-new-project.ps1** - Template setup (only for new projects from template)

---

## Your First Contribution

### Step 1: Understand the Dreams 💭

```powershell
# Open and read the dreams
code dreams/README.md

# Review existing specifications
ls dreams/specifications/

# Check architecture decisions
ls dreams/decisions/
```

**Ask yourself:**
- What is this project building?
- What problem does it solve?
- What are the key requirements?

### Step 2: Choose a Task

**For new projects:**
- Check GitHub Issues
- Look for issues labeled `good-first-issue`

**For existing projects:**
- Find an issue to work on
- Or create a new issue for your feature/bug

### Step 3: Create a Branch

```powershell
# For features
git checkout -b feature/your-feature-name

# For bug fixes
git checkout -b bugfix/your-bug-description

# For refactoring
git checkout -b refactor/your-refactor-description
```

### Step 4: Follow the 4-Phase Workflow

#### Phase 1: Discovery & Planning
1. Read relevant specs in `dreams/`
2. Explore the codebase
3. Create an implementation plan
4. Document your plan (use GitHub issue or local notes)

#### Phase 2: Plan Approval
1. Present your plan (in issue comments, PR description, or team meeting)
2. Get approval before coding
3. Update plan based on feedback

#### Phase 3: Execution (TDD)
1. **Red**: Write a failing test first
   ```powershell
   # Example
   cd tests/ProjectName.Tests
   # Create test file
   # Run: dotnet test (should fail)
   ```

2. **Green**: Write minimal code to pass
   ```powershell
   # Implement feature
   # Run: dotnet test (should pass)
   ```

3. **Refactor**: Improve while keeping tests green
   ```powershell
   # Improve code quality
   # Run: dotnet test (should still pass)
   # Check complexity: dotnet build /p:TreatWarningsAsErrors=true
   ```

#### Phase 4: Continuous Improvement
After merging:
1. Reflect on what went well
2. Note any challenges
3. Suggest process improvements
4. Document learnings

---

## Development Workflow

### Daily Development

```powershell
# 1. Pull latest changes
git pull origin main

# 2. Create/switch to your branch
git checkout feature/your-feature

# 3. Make changes following TDD
#    - Write test
#    - Implement
#    - Refactor

# 4. Run tests frequently
dotnet test

# 5. Check cognitive complexity
dotnet build /p:TreatWarningsAsErrors=true

# 6. Commit with conventional commits
git add .
git commit -m "feat: add user authentication"

# 7. Push your changes
git push origin feature/your-feature

# 8. Create Pull Request on GitHub
```

### Commit Message Format

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `refactor`: Code change that neither fixes bug nor adds feature
- `test`: Adding tests
- `docs`: Documentation changes
- `chore`: Maintenance tasks

**Examples:**
```bash
git commit -m "feat: add user login endpoint"
git commit -m "fix: resolve null reference in UserService"
git commit -m "refactor: simplify authentication logic"
git commit -m "test: add tests for UserController"
git commit -m "docs: update API documentation"
```

---

## Common Tasks

### Add a New Feature

```powershell
# 1. Create GitHub Issue (use feature template)
gh issue create --template feature.md --title "Feature: User Authentication"

# 2. Create branch
git checkout -b feature/user-authentication

# 3. Add specification to dreams/
echo "# User Authentication Spec" > dreams/specifications/user-authentication.md

# 4. Follow TDD workflow
cd tests/ProjectName.Tests
# Create test file
# Implement feature
# Refactor

# 5. Commit and push
git add .
git commit -m "feat: implement user authentication (closes #123)"
git push origin feature/user-authentication

# 6. Create PR and request review
```

### Fix a Bug

```powershell
# 1. Create GitHub Issue (use bug template)
gh issue create --template bug.md --title "Bug: Login fails for special characters"

# 2. Create branch
git checkout -b bugfix/login-special-characters

# 3. Write failing test that reproduces the bug
cd tests/ProjectName.Tests
# Add test case

# 4. Fix the bug
# Modify src/ProjectName/

# 5. Verify test passes
dotnet test

# 6. Commit and push
git commit -m "fix: handle special characters in login (fixes #124)"
git push origin bugfix/login-special-characters
```

### Refactor Code

```powershell
# 1. Identify high complexity
dotnet build /p:TreatWarningsAsErrors=true
# Note: Functions with complexity > 7

# 2. Create refactoring issue
gh issue create --template refactor.md

# 3. Create branch
git checkout -b refactor/reduce-complexity-userservice

# 4. Ensure tests exist and pass
dotnet test

# 5. Refactor while keeping tests green
# Make small changes
# Run tests after each change

# 6. Verify complexity reduced
dotnet build /p:TreatWarningsAsErrors=true

# 7. Commit and push
git commit -m "refactor: reduce UserService complexity from 12 to 6"
```

### Add Tests

```powershell
# Navigate to test project
cd tests/ProjectName.Tests

# Create test file (if needed)
# Follow naming: {ClassName}Tests.cs

# Run tests
dotnet test

# Check coverage (if configured)
dotnet test /p:CollectCoverage=true
```

### Check Code Quality

```powershell
# Check cognitive complexity
dotnet build /p:TreatWarningsAsErrors=true

# Run all tests
dotnet test

# Check code style (if configured)
dotnet format --verify-no-changes
```

---

## Troubleshooting

### Build Fails

**Issue**: `error CS0246: The type or namespace name 'X' could not be found`

**Solution**:
```powershell
dotnet restore
dotnet build
```

---

### Tests Fail

**Issue**: Tests passing locally but failing in CI

**Solution**:
- Check test dependencies
- Verify test data setup
- Review test isolation (tests should not depend on each other)

---

### Cognitive Complexity Violations

**Issue**: `S3776: Cognitive Complexity of XX is too high`

**Solution**:
1. Identify the complex function
2. Create refactoring issue
3. Break down into smaller functions
4. Use early returns
5. Extract complex conditions

**Example refactoring:**

```csharp
// Before (complexity 12)
public void ProcessOrder(Order order)
{
	if (order != null)
	{
		if (order.Items.Count > 0)
		{
			foreach (var item in order.Items)
			{
				if (item.IsValid())
				{
					// Complex processing
				}
			}
		}
	}
}

// After (complexity 4)
public void ProcessOrder(Order order)
{
	if (order == null || order.Items.Count == 0)
		return;

	foreach (var item in order.Items.Where(i => i.IsValid()))
	{
		ProcessItem(item);
	}
}

private void ProcessItem(Item item)
{
	// Extracted logic
}
```

---

### Git Conflicts

**Solution**:
```powershell
# Pull latest
git pull origin main

# Resolve conflicts in your editor
# After resolving:
git add .
git commit -m "chore: resolve merge conflicts"
git push
```

---

## Next Steps

### For New Contributors
1. ✅ Complete this getting started guide
2. ✅ Read dreams/README.md
3. ✅ Pick a `good-first-issue`
4. ✅ Follow the 4-phase workflow
5. ✅ Submit your first PR!

### For Regular Contributors
1. ✅ Review dreams/ before each feature
2. ✅ Follow TDD strictly
3. ✅ Keep complexity ≤ 7
4. ✅ Participate in retrospectives
5. ✅ Suggest process improvements

---

## Resources

### Documentation
- Project README: [README.md](README.md)
- Requirements: [dreams/README.md](dreams/README.md)
- Workflow: [copilot-instructions.md](copilot-instructions.md)
- Org Workflow: https://github.com/DreamBuildersGuild/.github

### Tools
- .NET Documentation: https://docs.microsoft.com/dotnet/
- Cognitive Complexity: https://www.sonarsource.com/docs/CognitiveComplexity.pdf
- Conventional Commits: https://www.conventionalcommits.org/
- GitHub CLI: https://cli.github.com/

### Support
- Project Issues: https://github.com/DreamBuildersGuild/ProjectName/issues
- Org Discussion: https://github.com/orgs/DreamBuildersGuild/discussions

---

**🎉 You're ready to build dreams! Happy coding! 🏗️**
