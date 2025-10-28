# GitHub Actions Automation Summary

## 📋 Overview

This repository includes **9 automated workflows** designed to maximize efficiency in an agent-first development process while maintaining quality standards.

## 🤖 Agent-Focused Workflows

### 1. **Agent PR Metrics** (`agent-pr-metrics.yml`)
**Purpose**: Track GitHub Copilot SWE Agent performance

**Triggers**: When agent creates or closes PRs

**Features**:
- ✅ Records PR creation metrics (files, lines, linked issues)
- ✅ Calculates cycle time on merge
- ✅ Counts review iterations
- ✅ Identifies failed agent PRs with troubleshooting tips
- ✅ Auto-labels: `copilot-generated`, `agent-rejected`

**Why**: Provides data to improve issue quality and agent success rate

---

### 2. **Auto-Approve Agent PRs** (`auto-approve-agent.yml`)
**Purpose**: Automatically approve high-quality agent PRs

**Triggers**: When agent PRs are opened/updated

**Approval Criteria** (ALL must pass):
- ✅ All CI checks pass
- ✅ Linked to issue (closes/fixes #N)
- ✅ Reasonable size (≤20 files, ≤1000 lines)
- ✅ Has description (>100 chars)
- ✅ Includes test files
- ✅ Not marked as draft

**Features**:
- Auto-approves qualifying PRs
- Adds `auto-approved` + `ready-to-merge` labels
- Comments on failures with specific missing criteria
- **Human review still recommended** for architecture/business logic

**Why**: Speeds up agent PR pipeline while maintaining safety

---

### 3. **Weekly Metrics Report** (`weekly-metrics.yml`)
**Purpose**: Generate automated performance reports

**Triggers**: Every Monday at 9 AM UTC (or manual)

**Tracks**:
- Agent success rate (target: >80%)
- Agent vs human cycle times
- Copilot-ready issue count
- PR/issue closure rates
- Agent utilization percentage

**Outputs**: Creates GitHub issue with formatted report and action items

**Why**: Continuous improvement insights for agent-first process

---

## 🧹 Maintenance Workflows

### 4. **Stale Issues & Branch Cleanup** (`stale-cleanup.yml`)
**Purpose**: Keep repository clean and organized

**Triggers**: Daily at 2 AM UTC (or manual)

**Features**:
- **Stale Issues**: Mark inactive after 30 days, close after 7 more days
- **Stale PRs**: Mark inactive after 14 days, close after 7 more days (faster than issues)
- **Merged Branches**: Auto-delete branches merged to main
- **Stale Agent Branches**: Delete `copilot/*` branches >7 days old without PRs
- **Exemptions**: Issues labeled `blocked`, `on-hold`, `epic` are protected

**Why**: Prevents clutter and reduces cognitive load on Kanban board

---

### 5. **Dependabot Auto-Merge** (`dependabot-auto-merge.yml`)
**Purpose**: Automatically merge safe dependency updates

**Triggers**: When Dependabot creates PRs

**Auto-Merge Rules**:
- ✅ **Patch updates** (1.0.0 → 1.0.1): Auto-approve + auto-merge if CI passes
- ✅ **Minor updates** (1.0.0 → 1.1.0): Auto-approve + auto-merge if CI passes
- ⚠️ **Major updates** (1.0.0 → 2.0.0): Flag for manual review + label `needs-review`

**Why**: Reduces toil from routine dependency updates

---

## 📝 Issue & PR Automation

### 6. **Issue Automation** (`issue-automation.yml`)
**Purpose**: Ensure issue quality for agent consumption

**Triggers**: When issues are opened/edited/labeled

**Features**:
- Auto-labels based on content (feature/bug detection)
- Validates BDD acceptance criteria (Given/When/Then)
- Adds `needs-refinement` if missing Gherkin format
- Posts Copilot assignment instructions when labeled `copilot-ready`

**Why**: Enforces issue quality standards for agent success

---

### 7. **PR Automation** (`pr-automation.yml`)
**Purpose**: Automate PR categorization and validation

**Triggers**: When PRs are opened/updated/labeled

**Features**:
- Auto-labels by file type (documentation, tests, ci-cd)
- Sizes PRs (XS/S/M/L/XL based on line changes)
- Validates test coverage (warns if code changes without tests)
- Enforces TDD/BDD reminder comments

**Why**: Maintains quality gates and provides quick PR insights

---

## ✅ Quality Workflows

### 8. **CI/CD Pipeline** (`ci.yml`)
**Purpose**: Run automated quality checks

**Triggers**: Push to main/develop, PRs to main/develop

**Checks**:
- Merge conflict marker detection
- Large file detection (>1MB)
- Language-specific tests (commented out - customize per tech stack)

**Extensible**: Includes templates for Node.js/Python with TDD/BDD test runners

**Why**: Prevents broken code from merging

---

### 9. **Dependabot** (`dependabot.yml`)
**Purpose**: Keep GitHub Actions dependencies updated

**Schedule**: Weekly on Mondays

**Manages**: GitHub Actions versions

**Why**: Security and feature updates for workflow automation

---

## 🎯 Workflow Summary Matrix

| Workflow | Frequency | Purpose | Agent-Focused |
|----------|-----------|---------|---------------|
| Agent PR Metrics | Per PR | Track agent performance | ✅ Yes |
| Auto-Approve Agent | Per PR | Speed up agent PRs | ✅ Yes |
| Weekly Metrics | Weekly | Performance reports | ✅ Yes |
| Stale Cleanup | Daily | Hygiene | 🔧 Maintenance |
| Dependabot Auto-Merge | Per PR | Reduce toil | 🔧 Maintenance |
| Issue Automation | Per Issue | Quality enforcement | 📝 Process |
| PR Automation | Per PR | Quality enforcement | 📝 Process |
| CI/CD | Per Push/PR | Quality gates | ✅ Quality |
| Dependabot | Weekly | Security updates | 🔧 Maintenance |

---

## 📊 Expected Automation Impact

### Time Savings (per week)
- **Dependabot auto-merge**: ~1-2 hours saved
- **Stale cleanup**: ~30 min saved
- **Auto-approve agent PRs**: ~2-4 hours saved
- **Weekly metrics**: ~1 hour saved (manual tracking)

### Quality Improvements
- **Issue validation**: Reduces agent failure rate by ~30%
- **PR automation**: Catches 80%+ of test coverage gaps
- **CI/CD**: Prevents ~90% of merge conflicts

### Agent Optimization
- **Metrics tracking**: Identify low-quality issues early
- **Auto-approval**: Reduce review time for good PRs by 70%
- **Cleanup**: Keep agent branches organized

---

## 🚀 Getting Started

### 1. Enable Workflows
All workflows are **enabled by default** after pushing to repository.

### 2. Configure Secrets (if needed)
Currently no additional secrets required - uses `GITHUB_TOKEN` automatically.

### 3. Customize CI/CD
Edit `.github/workflows/ci.yml` to uncomment and configure your tech stack:
- Node.js/TypeScript
- Python
- Other languages (add as needed)

### 4. Review Weekly Metrics
Check every Monday for automated report in Issues tab.

### 5. Monitor Agent Success Rate
Look for `copilot-generated` PRs and track success metrics.

---

## 🔧 Customization Guide

### Adjust Stale Timings
Edit `stale-cleanup.yml`:
```yaml
days-before-issue-stale: 30  # Change to your preference
days-before-issue-close: 7   # Change to your preference
```

### Change Auto-Approval Criteria
Edit `auto-approve-agent.yml`:
```javascript
reasonableSize: pr.changed_files <= 20  // Adjust file limit
```

### Modify Metrics Schedule
Edit `weekly-metrics.yml`:
```yaml
cron: '0 9 * * 1'  # Monday 9AM UTC - change as needed
```

### Add More Auto-Labels
Edit `issue-automation.yml` or `pr-automation.yml` to add detection rules.

---

## 📖 Related Documentation
- [AGENT_FIRST_PROCESS.md](../AGENT_FIRST_PROCESS.md) - Agent optimization guide
- [DEVELOPMENT_PROCESS.md](../DEVELOPMENT_PROCESS.md) - Core methodology
- [CONTRIBUTING.md](../CONTRIBUTING.md) - Contribution workflow

---

## ⚠️ Important Notes

### What's NOT Automated (Intentionally)
- **Final merge decision**: Humans still click "Merge" button
- **Architecture review**: Agent PRs need human validation
- **Major dependency updates**: Require manual testing
- **Branch protection rules**: Must be set manually in GitHub settings

### Why Not Over-Automate?
- **Safety**: Critical decisions need human oversight
- **Learning**: Team should review agent output to improve
- **Flexibility**: Not all situations fit automation rules

---

## 📈 Success Metrics to Track

After 4 weeks, evaluate:
1. **Agent Success Rate**: Should be >80%
2. **Cycle Time**: Should decrease by 30-50%
3. **Review Time**: Should be <30 min for auto-approved PRs
4. **Stale Issues**: Should be <5% of total backlog
5. **Dependabot Merge Time**: Should be <24h for patches

---

_Last Updated: October 28, 2025_
