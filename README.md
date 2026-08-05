# ProjectName

> **Template for DreamBuildersGuild projects** 🏗️

[Add a brief, compelling description of what this project does]

---

## 🎯 Vision

**dreams/** contains all requirements and specifications.

[Add one-sentence vision statement - what dream are you building?]

---

## 🚀 Quick Start

### Prerequisites
- .NET 10 SDK or later
- Visual Studio 2026 / VS Code / Rider
- Git

### Clone and Setup

```powershell
# Clone the repository
git clone https://github.com/DreamBuildersGuild/ProjectName.git
cd ProjectName

# Build the solution
dotnet build

# Run tests
dotnet test

# Run the application (if applicable)
dotnet run --project src/ProjectName
```

---

## 📂 Project Structure

```
ProjectName/
├── dreams/                   # 💭 Requirements, specs, and decisions
│   ├── specifications/       # Detailed technical specs
│   ├── examples/            # Reference examples
│   ├── research/            # Research notes
│   └── decisions/           # Architecture Decision Records
│
├── src/
│   └── ProjectName/         # Main project
│
├── tests/
│   └── ProjectName.Tests/   # Unit tests
│
├── docs/                    # Generated documentation
└── ProjectName.sln          # Solution file
```

See [dreams/README.md](dreams/README.md) for detailed information about requirements and specifications.

---

## 🛠️ Development

### Build

```powershell
dotnet build
```

### Test

```powershell
dotnet test
```

### Code Quality

This project enforces:
- ✅ **Cognitive Complexity ≤ 7** (via SonarAnalyzer.CSharp)
- ✅ **High Test Coverage** on business logic
- ✅ **Code Style** (.editorconfig)

Check cognitive complexity:
```powershell
dotnet build /p:TreatWarningsAsErrors=true
```

---

## 📋 Workflow

This project follows the **DreamBuildersGuild 4-Phase Workflow**:

### Phase 1: Discovery & Planning
- Review `dreams/` for requirements
- Explore codebase
- Create implementation plan
- Present plan for approval

### Phase 2: Plan Approval
- Review plan with team/stakeholders
- Get explicit approval before coding
- Ensure plan aligns with dreams

### Phase 3: Execution (TDD)
- **Red**: Write failing test first
- **Green**: Write minimal code to pass
- **Refactor**: Improve while keeping tests green
- Keep cognitive complexity ≤ 7

### Phase 4: Continuous Improvement
- Retrospective after each branch
- Document learnings
- Improve process

See [copilot-instructions.md](copilot-instructions.md) for complete workflow details.

---

## 🤝 Contributing

### For Team Members

1. **Read the dreams** - Start in `dreams/` to understand requirements
2. **Follow the workflow** - Use the 4-phase process
3. **Create issues** - Use GitHub issue templates
4. **Branch naming**: `feature/description`, `bugfix/description`, `refactor/description`
5. **Commit messages**: Follow [Conventional Commits](https://www.conventionalcommits.org/)
6. **Keep complexity low** - Every function ≤ 7 cognitive complexity
7. **Write tests first** - TDD approach
8. **Document decisions** - Add ADRs to `dreams/decisions/`

### For External Contributors

1. Fork the repository
2. Create a feature branch
3. Follow the workflow guidelines
4. Ensure all tests pass
5. Check cognitive complexity
6. Submit a pull request

---

## 📚 Documentation

- **[dreams/README.md](dreams/README.md)** - Requirements and specifications
- **[copilot-instructions.md](copilot-instructions.md)** - Project-specific workflow rules
- **[GETTING_STARTED.md](GETTING_STARTED.md)** - Detailed setup and onboarding
- **[Org Workflow](https://github.com/DreamBuildersGuild/.github)** - Organization-level standards

---

## 🧪 Testing

### Run All Tests
```powershell
dotnet test
```

### Run with Coverage
```powershell
dotnet test /p:CollectCoverage=true /p:CoverletOutputFormat=opencover
```

### Test Organization
- **Unit Tests**: `tests/ProjectName.Tests/`
- **Integration Tests**: (add if needed)
- **Test Naming**: `MethodName_Scenario_ExpectedResult`

---

## 🏗️ Architecture

[Add brief architecture overview or link to architecture documentation in dreams/]

### Key Technologies
- .NET 10
- [Add other frameworks/libraries]

### Key Patterns
- [Add architectural patterns used]
- [Reference ADRs in dreams/decisions/]

---

## 📊 Code Quality Standards

### Cognitive Complexity
Maximum complexity per function: **7**

Enforced by SonarAnalyzer.CSharp. Build will warn on violations.

### Test Coverage
- Business logic: High coverage required
- Infrastructure/plumbing: Lower coverage acceptable
- Focus on meaningful tests, not just coverage numbers

### Code Style
- Follow .editorconfig rules
- Use consistent naming (see .editorconfig)
- Enable nullable reference types
- Use latest C# language features

---

## 🔧 Configuration

### Development
- Configuration files in `dreams/` guide development
- Local settings: (add your local config approach)

### Production
- (add production configuration approach)

---

## 🚀 Deployment

[Add deployment instructions when applicable]

---

## 📝 License

[Add your license - e.g., MIT, Apache 2.0, Proprietary]

---

## 🙏 Acknowledgments

Built with the **DreamBuildersGuild** workflow and standards.

- Workflow: https://github.com/DreamBuildersGuild/.github
- Quality Standards: Cognitive Complexity ≤ 7, TDD
- Process: 4-Phase Workflow with Continuous Improvement

---

## 📞 Contact

[Add contact information for project maintainers]

---

**Built by DreamBuilders 🏗️ - Turning dreams into reality, one commit at a time.**
