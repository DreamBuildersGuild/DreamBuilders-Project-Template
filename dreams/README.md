# Dreams - ProjectName

> **"Every great project starts with a dream."** 💭

This folder contains all requirements, specifications, research, and decisions that guide the development of **ProjectName**.

---

## 📋 What's in Dreams?

The `dreams/` folder captures:
- **What we want to build** - Vision and requirements
- **Why we're building it** - Business case, user needs, problem statement
- **How it should work** - Specifications, examples, expected behavior

---

## 📂 Folder Structure

### `specifications/`
Detailed technical and business specifications.

**What goes here:**
- API specifications
- Protocol definitions
- Data models and schemas
- Business requirements documents
- Functional specifications

**Example files:**
- `api-specification.md`
- `data-model.md`
- `user-stories.md`

---

### `examples/`
Reference examples, sample data, and working demonstrations.

**What goes here:**
- Request/response examples
- Sample data files
- Reference implementations
- Code snippets showing expected usage

**Example files:**
- `request-examples.json`
- `sample-data.csv`
- `usage-examples.md`

---

### `research/`
Research notes, comparisons, and background information.

**What goes here:**
- Technology research
- Competitive analysis
- Performance benchmarks
- External references
- Proof-of-concept findings

**Example files:**
- `technology-comparison.md`
- `performance-benchmarks.md`
- `related-work.md`

---

### `decisions/`
Architecture Decision Records (ADRs) documenting key choices.

**What goes here:**
- Technology choices
- Architectural patterns
- Design decisions
- Trade-off analyses

**Format:** Use ADR template (see below)

**Example files:**
- `001-use-dotnet-10.md`
- `002-choose-postgresql.md`
- `003-event-sourcing-pattern.md`

---

## 📝 Architecture Decision Record (ADR) Template

```markdown
# ADR-NNN: [Short Title]

## Status
[Proposed | Accepted | Deprecated | Superseded]

## Context
[What is the issue we're facing? What forces are at play?]

## Decision
[What decision did we make?]

## Consequences
**Positive:**
- [Benefit 1]
- [Benefit 2]

**Negative:**
- [Trade-off 1]
- [Trade-off 2]

**Neutral:**
- [Impact 1]
```

---

## 🔄 Workflow Integration

### Phase 1: Discovery & Planning
- **Start here** - Review existing dreams
- **Explore** specifications and examples
- **Understand** the vision and requirements
- **Research** as needed, document in `research/`

### Phase 2: Plan Approval
- **Verify** plan aligns with specifications
- **Check** no conflicts with existing decisions
- **Update** dreams if requirements clarify

### Phase 3: Execution
- **Reference** specs in `specifications/`
- **Follow** decisions in `decisions/`
- **Use** examples for guidance
- **Implement** according to the dream

### Phase 4: Continuous Improvement
- **Reflect** - Did we achieve the dream?
- **Document** new decisions in `decisions/`
- **Update** specifications if needed
- **Add** examples from real implementation

---

## ✅ Best Practices

### Do:
✅ Start every feature by reviewing relevant specs in `dreams/`  
✅ Document all major decisions as ADRs  
✅ Keep specifications updated as understanding evolves  
✅ Add real examples from implementation back to `examples/`  
✅ Reference ADRs in code comments for context  

### Don't:
❌ Skip documenting important decisions  
❌ Let specifications become outdated  
❌ Assume everyone knows the context (write it down!)  
❌ Make architecture changes without updating ADRs  
❌ Delete old ADRs (mark as "Superseded" instead)  

---

## 🎯 Getting Started

### For New Contributors
1. **Read this README first** 📖
2. **Review `specifications/`** to understand what we're building
3. **Check `decisions/`** to understand why we made key choices
4. **Look at `examples/`** to see expected behavior
5. **Ready to contribute!** Start with Phase 1 of the workflow

### For New Features
1. **Document requirements** in `specifications/`
2. **Add examples** showing expected behavior
3. **Research** alternatives if needed (document in `research/`)
4. **Make decision** and create ADR in `decisions/`
5. **Follow the 4-phase workflow** to implement

---

## 📊 Dreams Status

**Project Vision:** [Add one-sentence vision statement]

**Current Phase:** [Discovery | Planning | Execution | Maintenance]

**Last Updated:** [Date]

---

## 🔗 Related Documentation

- Project README: `../README.md`
- Getting Started: `../GETTING_STARTED.md`
- Contributing: `../CONTRIBUTING.md` (if exists)
- Workflow: https://github.com/DreamBuildersGuild/.github

---

**Remember:** Dreams guide execution. Keep them clear, updated, and accessible! 💭✨
