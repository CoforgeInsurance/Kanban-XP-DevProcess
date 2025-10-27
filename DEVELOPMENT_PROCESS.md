# Development Process Guide

## Methodology: Kanban + XP + Lean

### Core Principles

**Kanban (Flow Management)**
- Visualize work using GitHub Projects board
- Limit work in progress (WIP) to maintain flow
- Pull work when capacity available
- Continuous delivery without fixed iterations

**XP Practices (Technical Excellence)**
- Pair programming for complex features
- Continuous integration via GitHub Actions
- Collective code ownership
- Simple design and refactoring
- Coding standards enforcement

**BDD + TDD (Quality First)**
- Write scenarios in Gherkin format (Given/When/Then)
- Write failing tests before implementation
- Red → Green → Refactor cycle
- Automated test execution in CI pipeline

**Lean (Waste Elimination)**
- Minimize handoffs and waiting
- Deliver small increments frequently
- Eliminate unnecessary documentation
- Focus on value delivery

## GitHub Integration

### GitHub Projects Setup

**Board Structure**
- **Backlog**: Prioritized issues awaiting capacity
- **Ready**: Issues prepared with acceptance criteria
- **In Progress**: Active work (respect WIP limits)
- **Review**: Code complete, awaiting PR review
- **Done**: Merged and verified

**Custom Fields**
- Priority (High/Medium/Low)
- Size (XS/S/M/L/XL)
- Feature Area
- Dependencies (linked issues)

### Issue Management

**Issue Template**
```markdown
## User Story
As a [role], I want [capability] so that [benefit]

## Acceptance Criteria (BDD Scenarios)
Scenario: [description]
  Given [context]
  When [action]
  Then [outcome]

## Technical Notes
- Dependencies: #issue-numbers
- Blockers: [list]

## Definition of Done
- [ ] Tests written and passing
- [ ] Code reviewed
- [ ] Documentation updated
- [ ] Deployed to staging
```

**Issue Dependencies (DAG)**
- Use task lists in parent issues for subtasks
- Link related issues with "blocks" relationships
- Use GitHub Projects automation to move dependent items

### GitHub Actions Workflows

**CI Pipeline** (`.github/workflows/ci.yml`)
```yaml
name: CI
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run Tests (TDD)
        run: cargo test
      - name: Run BDD Tests
        run: cargo test --features bdd
      - name: Lint
        run: cargo clippy -- -D warnings
```

**Automation Rules**
- Auto-label PRs by changed files
- Move issues to "Review" when PR opened
- Move to "Done" when PR merged
- Run tests on every commit

### Pull Request Workflow

**PR Process**
1. Create feature branch from main
2. Write failing test (Red)
3. Implement minimum code (Green)
4. Refactor while keeping tests green
5. Open PR with template
6. Automated checks run via Actions
7. Peer review required
8. Merge after approval + passing tests

**PR Template**
```markdown
## Changes
[Brief description]

## Related Issues
Closes #issue-number

## Test Coverage
- [ ] Unit tests added/updated
- [ ] BDD scenarios added/updated
- [ ] All tests passing locally

## Reviewer Checklist
- [ ] Code follows standards
- [ ] Tests are sufficient
- [ ] No unnecessary complexity
```

## Workflow

### Planning (Continuous)

**Backlog Refinement**
- Keep top 5-10 issues ready with clear acceptance criteria
- Define BDD scenarios collaboratively
- Identify dependencies and blockers
- Size issues relatively (not time estimates)

**Priority Management**
- Customer value drives priority
- Technical debt addressed continuously
- Dependencies resolved before dependents

### Execution (Pull-Based)

**Starting Work**
1. Pull highest priority issue from Ready
2. Move to In Progress
3. Create feature branch
4. Write BDD scenario test (failing)
5. Write unit tests (TDD - failing)
6. Implement code to pass tests
7. Refactor and clean up

**WIP Limits**
- Individual: 1-2 issues maximum
- Team: Based on capacity (typically 3-5 total)
- If blocked, swarm to unblock or pull next item

### Review & Delivery

**Code Review Focus**
- Tests validate acceptance criteria
- Code is simple and maintainable
- Standards followed
- No premature optimization

**Continuous Deployment**
- Main branch always deployable
- GitHub Actions automates deployment
- Feature flags for incomplete features
- Monitor and rollback if issues

## Metrics (Lean)

**Flow Metrics**
- Cycle time (Ready → Done)
- Throughput (issues completed per week)
- WIP age (time in In Progress)

**Quality Metrics**
- Test coverage percentage
- Build success rate
- Production defect rate

**Avoid**
- Velocity tracking (Scrum metric)
- Individual productivity metrics
- Burn-down charts

## Daily Practice

**Morning**
- Check GitHub Projects board
- Review PR notifications
- Pull new work if capacity available

**Throughout Day**
- Commit frequently to feature branch
- Run tests locally before push
- Request review when PR ready
- Review others' PRs promptly

**Before End of Day**
- Update issue status/comments
- Ensure work is pushed
- Note blockers on issues

## Tools Summary

- **GitHub Issues**: Work item tracking with dependencies
- **GitHub Projects**: Kanban board visualization
- **GitHub Actions**: CI/CD automation for TDD/BDD
- **GitHub PRs**: Code review and integration
- **Branch Protection**: Enforce review + tests before merge

## Key Success Factors

1. Keep issues small (< 1 day of work)
2. Write tests first (TDD/BDD discipline)
3. Respect WIP limits strictly
4. Review PRs within hours, not days
5. Automate everything repeatable
6. Focus on flow, not resource utilization
7. Eliminate waiting and handoffs
8. Deliver value continuously

---

*This process combines Kanban's flow efficiency, XP's technical practices, BDD/TDD's quality focus, and Lean's waste elimination using GitHub's native tooling.*
