# Agent-First Development Process

## 🤖 Optimized for GitHub Copilot SWE Agent

This document extends the **Kanban + XP + Lean** process to maximize GitHub Copilot SWE Agent's contribution to development.

---

## 🎯 Core Philosophy: Agent Does the Heavy Lifting

**Traditional Flow**: Human writes code → Human writes tests → Human creates PR
**Agent-First Flow**: Human writes detailed issue → **Agent writes tests + code + PR** → Human reviews

### Why This Works

- ✅ **Copilot SWE Agent** is excellent at implementing well-defined requirements
- ✅ **TDD/BDD** provides perfect specification format for agent
- ✅ **Humans** focus on high-value activities: design, review, architecture
- ✅ **Faster delivery** with maintained quality

---

## 📋 The Agent-First Workflow

### **Phase 1: Human-Led Issue Creation** (15-30 min per issue)

**Objective**: Write crystal-clear issue that becomes agent's blueprint

#### 1️⃣ **Issue Template Optimized for SWE Agent**

```markdown
## User Story
As a [role]
I want [capability]  
So that [benefit]

## Acceptance Criteria (BDD Scenarios) ⭐ CRITICAL FOR AGENT
Scenario: [Primary happy path]
  Given [initial state with specific data]
  When [user action with exact parameters]
  Then [expected outcome with verifiable results]
  And [side effects or state changes]

Scenario: [Edge case 1]
  Given [edge condition]
  When [action]
  Then [expected handling]

Scenario: [Error case]
  Given [error condition]
  When [triggering action]
  Then [error handling behavior]

## Technical Implementation Guidance 🤖 FOR AGENT

### Files to Create/Modify
- `src/features/[feature]/[component].ts` - Main implementation
- `src/features/[feature]/[component].test.ts` - Unit tests (Jest)
- `tests/e2e/[feature].spec.ts` - BDD tests (Cucumber/Playwright)
- `src/features/[feature]/types.ts` - TypeScript interfaces

### Key Functions/Classes
- `ClassName.methodName()` - Purpose and signature
- `helperFunction()` - What it should do
- `validateInput()` - Validation rules

### Test Framework & Patterns
- **Unit Tests**: Jest with @testing-library
- **BDD Tests**: Cucumber or Vitest + describe/it syntax
- **Mocking**: Mock external APIs with MSW or jest.mock()
- **Coverage**: Aim for 80%+ line coverage

### Dependencies & Libraries
- Use existing: `[library@version]`
- Add if needed: `[new-library]` for [purpose]

### API Contracts (if applicable)
```typescript
interface RequestPayload {
  field: string;
  // ...
}

interface ResponsePayload {
  result: string;
  // ...
}
```

### Integration Points
- Database: [schema/table name]
- External API: [endpoint URL, auth method]
- Event bus: [event name, payload structure]

### Error Handling Requirements
- Validation errors → 400 with specific message
- Not found → 404
- Auth failures → 401/403
- Server errors → 500 with logged details

### Performance Constraints
- API response time: < 200ms
- Database queries: < 50ms
- Max payload size: 1MB

## Definition of Done ✅
- [ ] All BDD scenarios pass as automated tests
- [ ] Unit test coverage > 80%
- [ ] No TypeScript/ESLint errors
- [ ] Code follows project patterns (see CONTRIBUTING.md)
- [ ] Error handling for all edge cases
- [ ] Documentation/JSDoc for public APIs
- [ ] CI/CD pipeline passes

## Out of Scope 🚫
- [What NOT to include]
- [Future enhancements]

## References
- Design doc: [link]
- Related issues: #123, #456
- API spec: [link]
```

#### 2️⃣ **Issue Quality Checklist** (Before assigning to agent)

**Must Have** ⭐:
- [ ] At least 3 BDD scenarios (happy path, edge case, error case)
- [ ] Specific file paths to create/modify
- [ ] Function names and purposes defined
- [ ] Test framework specified
- [ ] Expected input/output examples
- [ ] Clear definition of done

**Should Have** 🎯:
- [ ] TypeScript interfaces/types defined
- [ ] API contracts specified
- [ ] Error handling requirements
- [ ] Performance constraints
- [ ] Links to related code/docs

**Nice to Have** 💡:
- [ ] Architecture diagram
- [ ] Code snippets showing patterns
- [ ] Example test structure
- [ ] Migration notes (if DB changes)

#### 3️⃣ **Label the Issue**

Apply these labels:
- `copilot-ready` ← **REQUIRED for agent assignment**
- `size/S` or `size/M` ← Keep small!
- `feature` / `bug` / `technical-debt`
- `[feature-area]` ← e.g., `auth`, `api`, `ui`

---

### **Phase 2: Agent Execution** (Automated - 1-4 hours)

**What Happens**:
1. **Assign issue to `@github-copilot`** (or use GitHub UI)
2. Agent analyzes issue and creates **implementation plan**
3. Agent creates **feature branch** (e.g., `copilot/issue-123`)
4. Agent writes **BDD tests** based on scenarios (Red phase)
5. Agent writes **unit tests** (TDD Red phase)
6. Agent **implements code** to pass tests (Green phase)
7. Agent **refactors** code (Refactor phase)
8. Agent **creates WIP PR** linked to issue
9. Agent **runs CI/CD** to verify all tests pass

**GitHub Project Automation**:
- Issue moves from **Ready** → **In Progress** (agent starts)
- PR created → Issue moves to **Review**
- Human notified via GitHub notification

**Typical Agent Output**:
- ✅ 5-15 test files created/updated
- ✅ 3-10 source files created/updated
- ✅ Documentation updated
- ✅ All tests passing
- ✅ PR description with changes summary

---

### **Phase 3: Human Review** (15-45 min per PR)

**Objective**: Verify quality, architecture, and edge cases

#### Review Focus Areas

**1. Tests Validate Requirements** ⭐ MOST IMPORTANT
```bash
# Review BDD tests match acceptance criteria
git diff main..copilot/issue-123 -- tests/

# Check test coverage
npm run test:coverage
```

**Questions to Ask**:
- [ ] Do BDD scenarios match the issue exactly?
- [ ] Are edge cases covered?
- [ ] Are error cases tested?
- [ ] Is the test structure clear and maintainable?

**2. Code Quality & Architecture**
- [ ] Follows project patterns and conventions
- [ ] No unnecessary complexity (YAGNI)
- [ ] Proper separation of concerns
- [ ] Error handling is robust
- [ ] No security vulnerabilities

**3. Performance & Scalability**
- [ ] No N+1 queries
- [ ] Efficient algorithms (not just "works")
- [ ] Proper indexing (if database changes)
- [ ] Memory leaks prevented

**4. Integration & Dependencies**
- [ ] External APIs mocked correctly
- [ ] Database migrations included (if needed)
- [ ] Breaking changes documented
- [ ] Backward compatibility maintained

#### Review Process

**Option A: Quick Approval** (15 min)
- Agent got it right first time
- Minor tweaks needed
- Request changes via PR comments
- Agent updates PR

**Option B: Collaborative Refinement** (30-45 min)
- Significant changes needed
- Use PR review comments
- Tag specific lines for agent to fix
- Request architectural changes
- Agent makes updates

**Option C: Human Takeover** (rare)
- Issue was too complex for agent
- Architecture needs redesign
- Close agent's PR
- Human implements with agent assistance (Copilot in IDE)

---

### **Phase 4: Merge & Monitor** (5 min)

**After Approval**:
1. ✅ Ensure all CI/CD checks pass
2. ✅ Squash and merge (clean history)
3. ✅ Auto-closes issue (via "Closes #123")
4. ✅ Issue moves to **Done** column
5. ✅ Monitor production metrics

**Post-Merge**:
- [ ] Verify deployment successful
- [ ] Check error monitoring (Sentry/etc)
- [ ] Update documentation if needed
- [ ] Archive issue after 2 weeks

---

## 📊 Modified Kanban Board States for Agent-First

### **Backlog** (Human Activity)
- **What**: Issues not yet refined
- **Action**: Product owner prioritizes
- **Agent involvement**: None

### **Ready** (Human Activity - CRITICAL)
- **What**: Issues fully specified with BDD scenarios
- **Action**: Team refines issues to be agent-ready
- **Time spent**: 15-30 min per issue
- **Quality gate**: Must pass "Issue Quality Checklist"
- **Agent involvement**: None (humans prepare)

### **In Progress** (Agent Activity)
- **What**: Agent is implementing
- **Indicators**: Branch created, commits happening, WIP PR
- **Human action**: Monitor, answer questions if agent asks
- **WIP limit**: 3-5 issues per agent (parallel work)
- **Typical duration**: 1-4 hours

### **Review** (Human Activity - CRITICAL)
- **What**: Agent's PR awaiting human review
- **Action**: Human reviews tests + code + architecture
- **Time spent**: 15-45 min per PR
- **SLA**: Review within 4-8 hours
- **Agent involvement**: Makes requested changes

### **Done** (Automated)
- **What**: Merged and deployed
- **Agent involvement**: None
- **Auto-archive**: After 2 weeks

---

## 🎯 Optimized Metrics for Agent-First

### Agent Performance Metrics

**Agent Success Rate**:
- % of agent PRs merged without major changes
- Target: > 80%
- **Low score means**: Issues need better specifications

**Agent Cycle Time**:
- Time from assignment to WIP PR creation
- Target: < 4 hours for size/S, < 8 hours for size/M
- **Slow means**: Issues too complex, break them down

**Test Coverage by Agent**:
- % of code covered by agent-written tests
- Target: > 80%
- **Low score means**: BDD scenarios incomplete

### Human Performance Metrics

**Issue Refinement Quality**:
- % of agent-ready issues that need clarification
- Target: < 20%
- **High score means**: Improve issue templates

**Review Turnaround Time**:
- Time from WIP PR to merge or feedback
- Target: < 8 hours (same day)
- **Slow means**: Bottleneck in human review

**Rework Rate**:
- % of PRs requiring > 2 rounds of changes
- Target: < 30%
- **High score means**: Issues underspecified or agent struggles

### Flow Metrics (Same as Before)

- Cycle time (Ready → Done): Target < 1 day for size/S
- Throughput: Issues completed per week
- WIP age: Time in In Progress (agent work)

---

## 🚀 Best Practices for Agent-First Development

### 1. **Issue Size Matters Even More**

**Agent Sweet Spot**:
- ✅ **Size/XS-S**: Single component, < 200 lines, 1-2 hours
- ✅ **Size/M**: Feature module, < 500 lines, 4-8 hours
- ⚠️ **Size/L**: Too complex, break it down!
- ❌ **Size/XL**: Agent will struggle, definitely split

**Breaking Down Large Features**:
```
Epic: User Authentication System

Sub-issues for Agent:
├── #101 - Implement login API endpoint (Size/S) ← Agent
├── #102 - Add password validation logic (Size/S) ← Agent  
├── #103 - Create JWT token service (Size/S) ← Agent
├── #104 - Build login UI component (Size/S) ← Agent
├── #105 - Add session management (Size/M) ← Agent
└── #106 - Integrate with auth provider (Size/M) ← Human + Agent
```

### 2. **BDD Scenarios Are Your Contract**

The better your scenarios, the better agent's output:

**❌ Bad** (Too vague):
```gherkin
Scenario: User logs in
  Given user enters credentials
  When they submit
  Then they are logged in
```

**✅ Good** (Specific and testable):
```gherkin
Scenario: Successful login with valid credentials
  Given a registered user with email "test@example.com" and password "SecurePass123!"
  And the user is on the login page
  When the user enters email "test@example.com" in the email field
  And the user enters password "SecurePass123!" in the password field
  And the user clicks the "Login" button
  Then the user should be redirected to "/dashboard"
  And a session token should be stored in localStorage with key "authToken"
  And the API should have been called with POST /api/auth/login
  And the response status should be 200
```

### 3. **Provide Code Examples**

Show agent the patterns you want:

```markdown
## Technical Implementation Guidance

### Example Test Structure
```typescript
describe('UserService', () => {
  describe('login', () => {
    it('should return auth token on valid credentials', async () => {
      // Arrange
      const mockUser = { email: 'test@example.com', password: 'hashed' };
      mockDb.findOne.mockResolvedValue(mockUser);
      
      // Act
      const result = await userService.login('test@example.com', 'SecurePass123!');
      
      // Assert
      expect(result).toHaveProperty('token');
      expect(result.token).toMatch(/^[\w-]+\.[\w-]+\.[\w-]+$/); // JWT format
    });
  });
});
```

### Example Implementation Pattern
```typescript
export class UserService {
  async login(email: string, password: string): Promise<AuthResult> {
    // 1. Validate inputs
    this.validateEmail(email);
    this.validatePassword(password);
    
    // 2. Fetch user
    const user = await this.userRepo.findByEmail(email);
    if (!user) throw new UnauthorizedError('Invalid credentials');
    
    // 3. Verify password
    const isValid = await bcrypt.compare(password, user.passwordHash);
    if (!isValid) throw new UnauthorizedError('Invalid credentials');
    
    // 4. Generate token
    const token = this.jwtService.sign({ userId: user.id });
    
    // 5. Return result
    return { token, userId: user.id };
  }
}
```
Use this pattern for other services.
```
```

### 4. **Use Sub-Issues for Complex Features**

**Parent Issue** (Human architects):
```markdown
## Epic: Implement Shopping Cart Feature

Architecture decisions:
- Use Redux for state management
- REST API with optimistic updates
- Store cart in localStorage + backend

Sub-issues (each assigned to agent):
- [ ] #201 - Cart state management (Redux slice)
- [ ] #202 - Add to cart API endpoint
- [ ] #203 - Cart UI component
- [ ] #204 - Cart persistence service
- [ ] #205 - Checkout flow integration
```

**Benefit**: Agent works in parallel on multiple sub-issues!

### 5. **Review PRs with "Agent Lens"**

**Don't expect**:
- ❌ Clever optimizations (agent plays it safe)
- ❌ Refactoring existing code (unless asked)
- ❌ Documentation beyond code comments
- ❌ Perfect variable naming (sometimes verbose)

**Do expect**:
- ✅ Tests that match specifications exactly
- ✅ Correct implementation of requirements
- ✅ Following provided examples/patterns
- ✅ Handling specified edge cases
- ✅ Error handling as described

### 6. **Iterate on Issue Quality**

**Track what works**:
```markdown
## Retrospective Notes (in issue comments)

Agent Success: ✅
- Clear BDD scenarios helped agent write perfect tests
- Providing TypeScript interfaces avoided type errors
- Example code pattern was followed exactly

Could Improve: ⚠️
- Didn't specify error message format, agent used generic messages
- Missing performance requirement, agent used inefficient query
- Should have linked to existing auth service

Next Time: 💡
- Add error message examples to acceptance criteria
- Include performance benchmarks in technical guidance
- Always reference related code files
```

---

## 🔄 Daily Workflow (Agent-First)

### **Morning** (30 min)

**Product Owner/Lead**:
- [ ] Review Kanban board
- [ ] Refine 2-3 issues in Backlog → move to Ready
- [ ] Assign 1-2 ready issues to `@github-copilot`
- [ ] Check agent's overnight progress

**Developers**:
- [ ] Review agent's PRs from yesterday/overnight
- [ ] Provide feedback on 1-2 PRs
- [ ] Monitor In Progress issues (agent working)

### **Throughout Day**

**Human Activities**:
- Refine issues (make them agent-ready)
- Review agent PRs (15-45 min each)
- Approve and merge good PRs
- Request changes on PRs needing work
- Monitor CI/CD and production

**Agent Activities** (Automated):
- Implementing assigned issues
- Creating WIP PRs
- Responding to review feedback
- Running tests
- Updating PRs based on comments

### **Before End of Day** (15 min)

- [ ] Review day's completions (Done column)
- [ ] Check WIP PRs (anything stuck?)
- [ ] Prepare 3-5 issues for tomorrow (Ready queue)
- [ ] Update blockers/dependencies
- [ ] Quick retro: What helped agent succeed today?

---

## 🎓 Training Team for Agent-First

### **Week 1: Writing Agent-Ready Issues**

**Goal**: Team can write issues that agent executes successfully

**Activities**:
1. Workshop: Anatomy of agent-ready issue
2. Practice: Refine 5 backlog items together
3. Assign first issue to agent, observe
4. Review agent's PR as a team
5. Retrospective: What worked, what didn't

**Success Criteria**:
- [ ] 80% of issues result in mergeable PRs
- [ ] Team comfortable with BDD scenario writing
- [ ] Issue templates consistently used

### **Week 2: Effective Review Process**

**Goal**: Fast, high-quality PR reviews

**Activities**:
1. Workshop: Reviewing agent-generated code
2. Practice reviews on agent PRs
3. Pair review sessions
4. Establish review SLAs (< 8 hours)
5. Document review checklist

**Success Criteria**:
- [ ] Average review time < 8 hours
- [ ] < 30% rework rate
- [ ] Clear review feedback

### **Week 3-4: Optimization**

**Goal**: Maximum throughput with maintained quality

**Activities**:
1. Measure metrics (cycle time, success rate)
2. Identify bottlenecks
3. Optimize issue templates
4. Refine workflows
5. Continuous improvement

---

## 🚨 Troubleshooting Agent Issues

### **Agent Doesn't Start Work**

**Symptoms**:
- Issue assigned but no branch/PR created
- Hours pass with no activity

**Causes & Solutions**:
1. ❌ **Issue not labeled `copilot-ready`** → Add label
2. ❌ **Acceptance criteria missing** → Add BDD scenarios
3. ❌ **Issue too vague** → Add technical guidance
4. ❌ **Agent quota exceeded** → Wait or contact admin

### **Agent Creates PR But Tests Fail**

**Symptoms**:
- PR created quickly but CI/CD fails
- Test coverage low

**Causes & Solutions**:
1. ❌ **BDD scenarios incomplete** → Add missing edge cases
2. ❌ **Test framework not specified** → Update issue with framework
3. ❌ **Environment config missing** → Provide .env.example
4. ❌ **External dependencies** → Specify mocking strategy

### **Agent's Code Doesn't Follow Patterns**

**Symptoms**:
- Code works but doesn't match project style
- Different architecture than expected

**Causes & Solutions**:
1. ❌ **No code examples provided** → Add example snippets
2. ❌ **Pattern not documented** → Link to similar code
3. ❌ **First time seeing this pattern** → Show, don't just tell
4. ❌ **Agent hallucinating** → Provide more constraints

### **Agent Gets Stuck/Confused**

**Symptoms**:
- PR shows partial implementation
- Comments asking for clarification
- Incorrect implementation

**Causes & Solutions**:
1. ❌ **Conflicting requirements** → Simplify, prioritize
2. ❌ **Missing dependencies** → List all dependencies
3. ❌ **Complex business logic** → Break into smaller issues
4. ❌ **Issue too large** → Split into sub-issues

---

## 📈 Success Metrics (Target After 3 Months)

### **Efficiency Gains**

- **Agent contribution**: 60-80% of code written by agent
- **Human coding time**: -70% (focus on architecture/review)
- **Cycle time**: -50% (Ready → Done)
- **Throughput**: +100% (2x more issues completed)

### **Quality Maintained**

- **Test coverage**: > 80% (agent writes comprehensive tests)
- **Bug rate**: Same or lower (tests catch issues early)
- **Code review time**: -30% (agent handles obvious issues)
- **Production incidents**: No increase

### **Developer Satisfaction**

- **Less repetitive work**: +90%
- **More time for design**: +200%
- **Faster iterations**: +150%
- **Learning from agent**: High (new patterns, tests)

---

## 🎯 Summary: Maximizing Agent Potential

**The Formula**:
```
Great Issue Spec (Human 30min) 
  → Agent Implementation (Automated 2-6 hours)
  → Quick Review (Human 30min)
  → Merge & Deploy
  
= 10x faster than traditional development
```

**Key Principles**:
1. ✅ **Humans do high-value work**: Design, architecture, review, strategy
2. ✅ **Agent does heavy lifting**: Writing tests, implementing code, documentation
3. ✅ **BDD scenarios are the contract**: Clear, testable, unambiguous
4. ✅ **Small issues win**: Keep < 1 day, agent excels at focused tasks
5. ✅ **Fast feedback loops**: Review PRs same day, keep flow moving
6. ✅ **Continuous improvement**: Track metrics, refine process, optimize issues

**Remember**: The quality of agent's output is directly proportional to the quality of your issue specification. Invest in writing great issues, and the agent will deliver great code! 🚀

---

*This agent-first process transforms your Kanban + XP + Lean methodology into a high-velocity, AI-assisted development powerhouse while maintaining quality through BDD/TDD discipline.*
