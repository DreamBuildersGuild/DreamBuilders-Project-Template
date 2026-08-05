# ProjectName - Copilot Instructions

> **Project-specific instructions for GitHub Copilot**

This file provides project-specific guidance for GitHub Copilot when working on **ProjectName**.

---

## 💭 Dreams Folder - Start Here!

**All requirements, specifications, and decisions are in**: `dreams/`

### When Implementing Features
1. ✅ **Always start by reading** `dreams/specifications/` for the feature
2. ✅ **Check** `dreams/decisions/` for relevant architecture decisions
3. ✅ **Use examples** from `dreams/examples/` as reference
4. ✅ **Follow the vision** in `dreams/README.md`

### When Making Architectural Decisions
1. ✅ **Document decision** as ADR in `dreams/decisions/`
2. ✅ **Use ADR template** from `dreams/README.md`
3. ✅ **Reference** the ADR number in code comments

**Example:**
```csharp
// Implementation follows ADR-003: Event Sourcing Pattern
// See: dreams/decisions/003-event-sourcing-pattern.md
```

---

## 🎯 Project-Specific Guidelines

### Technology Stack
- **.NET 10** (target framework)
- **C# 13** (latest language features)
- **xUnit** for testing
- [Add other frameworks/libraries specific to your project]

### Project-Specific Standards
[Add any project-specific coding standards, patterns, or requirements]

**Example:**
```markdown
### Authentication
- Use OAuth2 with Azure AD
- See: dreams/specifications/authentication-spec.md

### Data Access
- Use Entity Framework Core
- Repository pattern for data access
- See: dreams/decisions/002-use-ef-core.md
```

---

## 🔄 Standard DreamBuildersGuild Workflow

This project follows the **DreamBuildersGuild 4-Phase Workflow**.

> **Full workflow**: https://github.com/DreamBuildersGuild/.github/blob/main/copilot-instructions.md

### Phase 1: Discovery & Planning
- Review `dreams/` for requirements and specifications
- Explore codebase using code search and file navigation
- Clarify any ambiguities with user
- Create explicit implementation plan
- Present plan for approval

### Phase 2: Plan Approval
- ⚠️ **MANDATORY**: Wait for explicit user approval before execution
- User reviews plan
- User can request changes, reject, or approve
- **Never start Phase 3 without approval**

### Phase 3: Execution (TDD)
1. **Create GitHub Issue** (after approval, before coding)
   - Use appropriate template (feature, bug, refactor, technical-debt)
   - Link to plan

2. **Test-Driven Development (TDD)**
   - **Red**: Write failing test first
   - **Green**: Write minimal code to pass
   - **Refactor**: Improve while keeping tests green

3. **Code Quality**
   - Cognitive complexity ≤ 7 per function
   - High test coverage on business logic
   - Follow .editorconfig rules

4. **Commit & Link**
   - Commit with conventional commit messages
   - Link commits to issue (`fixes #123`)

5. **Pre-Commit Checks**
   - `dotnet build` succeeds
   - `dotnet test` passes
   - `dotnet build /p:TreatWarningsAsErrors=true` (complexity check)

### Phase 4: Continuous Improvement
- Run **after each branch** before merge
- Retrospective questions:
  1. What went well in this workflow?
  2. What challenges did you encounter?
  3. Were planning estimates accurate?
  4. Did the issue template capture everything?
  5. Were approval gates helpful or blocking?
  6. What would you change for next time?

- If process improvement identified:
  - Create issue in **DreamBuildersGuild/.github** repo
  - Use `process-improvement` template
  - Document in workflow CHANGELOG

---

## 📏 Quality Standards

### Cognitive Complexity
- **Maximum**: 7 per function
- **Enforced by**: SonarAnalyzer.CSharp
- **Check**: `dotnet build /p:TreatWarningsAsErrors=true`
- **Violations**: Require explicit approval before merge

### Test Coverage
- **Business logic**: High coverage required
- **Infrastructure**: Moderate coverage acceptable
- **Framework**: TDD (Red-Green-Refactor)

### Code Style
- Follow **.editorconfig** rules
- Use **nullable reference types**
- Enable **implicit usings**
- Use **latest C# features**

---

## 🧪 Test-Driven Development (TDD)

### Always Follow TDD Cycle
1. **Red**: Write a failing test
   ```powershell
   cd tests/ProjectName.Tests
   # Write test
   dotnet test  # Should fail
   ```

2. **Green**: Write minimal code to pass
   ```powershell
   # Implement in src/ProjectName/
   dotnet test  # Should pass
   ```

3. **Refactor**: Improve while keeping tests green
   ```powershell
   # Refactor code
   dotnet test  # Should still pass
   dotnet build /p:TreatWarningsAsErrors=true  # Check complexity
   ```

### Test Naming Convention
```csharp
[MethodName]_[Scenario]_[ExpectedResult]

// Example:
public void ProcessOrder_WithValidOrder_ReturnsSuccess()
public void ProcessOrder_WithNullOrder_ThrowsArgumentNullException()
public void ProcessOrder_WithEmptyItems_ReturnsZero()
```

---

## 📝 GitHub Issues Integration

### When to Create Issues
- **After plan approval, before execution** (Features, Refactorings, Technical Debt)
- **Immediately when discovered** (Bugs)
- **After retrospective** (Process Improvements → DreamBuildersGuild/.github repo)

### Issue Templates
Use GitHub issue templates:
- **Feature**: New functionality
- **Bug**: Defects/errors
- **Refactor**: Code quality improvements
- **Technical Debt**: Cleanup work
- **Process Improvement**: Workflow enhancements (in .github repo)

### Commit Keywords
Link commits to issues:
- `fixes #123` - Closes issue when merged
- `closes #456` - Closes issue when merged  
- `resolves #789` - Closes issue when merged
- `relates to #101` - Links without closing

---

## 🎨 Development Principles

1. **Simplicity First**: Start simple, add complexity only when needed
2. **Iterative Approach**: Small, incremental changes
3. **Explicit Over Implicit**: Clear approvals, no assumptions
4. **User-Centric**: Frequent communication, approval gates
5. **Minimal Changes**: Smallest possible change to solve the problem
6. **TDD Approach**: Tests first, then implementation
7. **Dream-Driven**: Always reference `dreams/` for requirements

---

## 🔗 Resources

### Project Documentation
- **README.md** - Project overview
- **GETTING_STARTED.md** - Setup and onboarding
- **dreams/README.md** - Requirements and specifications

### Workflow Documentation
- **Org Workflow**: https://github.com/DreamBuildersGuild/.github
- **Issue Templates**: https://github.com/DreamBuildersGuild/.github/tree/main/.github/ISSUE_TEMPLATE
- **Quick Start**: https://github.com/DreamBuildersGuild/.github/blob/main/QUICK_START.md

---

## ✅ Checklist for Every Feature

- [ ] Read relevant specs in `dreams/specifications/`
- [ ] Check architecture decisions in `dreams/decisions/`
- [ ] Create implementation plan (Phase 1)
- [ ] Get plan approved (Phase 2)
- [ ] Create GitHub Issue
- [ ] Write failing test (Red)
- [ ] Implement feature (Green)
- [ ] Refactor if needed
- [ ] Verify complexity ≤ 7
- [ ] Run all tests
- [ ] Commit with issue reference
- [ ] Run retrospective (Phase 4)

---

**Remember**: Dreams guide execution. Keep them clear, updated, and always referenced! 💭✨
