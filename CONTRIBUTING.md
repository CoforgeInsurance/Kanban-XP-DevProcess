# Contributing to This Project

Thank you for contributing! This project follows **Kanban + XP + Lean** methodologies with **BDD/TDD** practices and is optimized for **GitHub Copilot** assistance.

## 🎯 Quick Start

1. **Check the board**: Review [GitHub Projects](../../projects) for available work
2. **Pick an issue**: Pull from "Ready" column (respect WIP limits)
3. **Create branch**: `git checkout -b feature/issue-number-description`
4. **Write tests first**: Follow TDD/BDD approach
5. **Implement**: Make tests pass
6. **Open PR**: Use the PR template
7. **Review**: Address feedback promptly

## 📋 Development Process

### Writing Issues (Copilot-Optimized)

Create issues with clear acceptance criteria to enable Copilot assistance:

```markdown
## User Story
As a [role]
I want [capability]
So that [benefit]

## Acceptance Criteria (BDD)
Scenario: [description]
  Given [context]
  When [action]
  Then [expected outcome]

## Technical Implementation Hints
- Files to modify: src/components/MyComponent.tsx
- Related functions: handleSubmit(), validateForm()
- Test framework: Jest
- API endpoints: POST /api/users
```

**Best Practices**:
- ✅ Include specific file paths
- ✅ Mention related functions/classes
- ✅ Specify test framework
- ✅ Define expected behavior clearly
- ✅ Keep issues small (< 1 day of work)

### TDD/BDD Workflow

**Red → Green → Refactor**

1. **Red**: Write failing test
   ```bash
   # Write test that describes expected behavior
   npm test -- MyComponent.test.ts
   # Test should fail (Red)
   ```

2. **Green**: Make test pass with minimum code
   ```bash
   # Implement just enough to pass
   npm test -- MyComponent.test.ts
   # Test should pass (Green)
   ```

3. **Refactor**: Improve while keeping tests green
   ```bash
   # Clean up code
   npm test
   # All tests still passing
   ```

### Working with GitHub Copilot

**Assigning Issues to Copilot**:
1. Ensure issue has clear acceptance criteria (Gherkin format)
2. Add technical implementation hints
3. Label issue as `copilot-ready`
4. Assign to @github-copilot (if available)

**Requesting Copilot PR Review**:
1. Open your PR
2. Click "Reviewers" → Add "github/copilot"
3. Address Copilot's feedback
4. Then request human review

**When Copilot Works Best**:
- ✅ Well-defined features with clear criteria
- ✅ Bug fixes with reproduction steps
- ✅ Refactoring with specific goals
- ✅ Test coverage improvements
- ❌ Vague requirements
- ❌ Complex architectural decisions
- ❌ Issues requiring business context

### Pull Request Guidelines

**Before Opening PR**:
- [ ] All tests passing locally
- [ ] Code follows project standards
- [ ] Self-review completed
- [ ] Commit messages are clear

**PR Size Guidelines**:
- 🟢 **XS/S** (< 250 lines): Ideal
- 🟡 **M** (250-500 lines): Good
- 🟠 **L** (500-1000 lines): Consider splitting
- 🔴 **XL** (> 1000 lines): Must split

**PR Review Process**:
1. Automated checks run (CI)
2. Copilot review (optional but recommended)
3. Human review (required)
4. Address feedback
5. Merge after approval

## 🏗️ Code Standards

### General Principles
- **YAGNI**: You Ain't Gonna Need It - Don't add unused features
- **DRY**: Don't Repeat Yourself - Extract common logic
- **KISS**: Keep It Simple, Stupid - Avoid unnecessary complexity
- **SRP**: Single Responsibility Principle

### Testing Requirements
- **Unit Tests**: Test individual functions/classes
- **BDD Tests**: Test user scenarios (Given/When/Then)
- **Coverage**: Maintain or improve test coverage
- **Edge Cases**: Test boundary conditions

### Git Commit Messages
```
type(scope): brief description

Longer description if needed

Closes #123
```

**Types**: `feat`, `fix`, `refactor`, `test`, `docs`, `chore`

**Examples**:
- `feat(auth): add login functionality`
- `fix(api): handle null response from user service`
- `test(cart): add BDD scenarios for checkout flow`

## 🚀 Kanban Workflow

### Board Columns

1. **Backlog**: Prioritized work awaiting capacity
2. **Ready**: Issues with clear acceptance criteria
3. **In Progress**: Active development (WIP limit: 1-2 per person)
4. **Review**: PR open, awaiting review
5. **Done**: Merged and verified

### WIP Limits
- **Individual**: 1-2 issues maximum
- **Team**: 3-5 total in "In Progress"
- **Why**: Maintain flow, reduce context switching

### Issue Dependencies
- Link blocking issues: "Blocked by #123"
- Use task lists for sub-tasks
- Resolve dependencies before starting work

## 🔄 Daily Practice

**Morning**:
- Check Projects board
- Review PR notifications
- Pull new work if under WIP limit

**Throughout Day**:
- Commit frequently
- Run tests before push
- Update issue status
- Review others' PRs promptly

**Before End of Day**:
- Push work in progress
- Note any blockers on issues
- Update PR if feedback received

## 🤝 Code Review

### As a Reviewer
- **Focus on**: Tests, simplicity, maintainability
- **Avoid**: Nitpicking, premature optimization
- **Response time**: Within hours, not days
- **Be kind**: Constructive feedback only

### As an Author
- **Respond quickly**: Address feedback promptly
- **Explain decisions**: Add context when needed
- **Don't take personally**: Feedback improves code
- **Thank reviewers**: Appreciate their time

## 📊 Quality Metrics

We track:
- ✅ Cycle time (Ready → Done)
- ✅ Test coverage percentage
- ✅ Build success rate
- ❌ Individual productivity (we don't measure this)
- ❌ Velocity/story points (Scrum metrics)

## 🛠️ Tech Stack Setup

### Prerequisites
```bash
# Install dependencies (example for Node.js)
npm install

# Run tests
npm test

# Run linter
npm run lint

# Start development server
npm run dev
```

### Environment Variables
Copy `.env.example` to `.env` and configure:
```bash
cp .env.example .env
```

## 📚 Resources

- [Development Process Guide](./DEVELOPMENT_PROCESS.md)
- [GitHub Copilot Documentation](https://docs.github.com/en/copilot)
- [BDD with Gherkin](https://cucumber.io/docs/gherkin/)
- [TDD Guide](https://testdriven.io/)
- [Kanban Guide](https://www.atlassian.com/agile/kanban)

## ❓ Questions?

- **Process questions**: Check [DEVELOPMENT_PROCESS.md](./DEVELOPMENT_PROCESS.md)
- **Technical questions**: Ask in issue comments
- **Blockers**: Update issue and notify team

---

**Remember**: Small increments, frequent delivery, continuous improvement! 🚀
