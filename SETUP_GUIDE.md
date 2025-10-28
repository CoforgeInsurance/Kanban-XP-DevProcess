# 🚀 Repository Setup Guide

This guide walks you through configuring the **Kanban-XP-DevProcess** repository for your team. Most configuration has been automated, but some steps require manual setup in the GitHub UI.

## ✅ Automated Setup (Already Complete)

The following have been configured automatically:

- ✅ Issue templates (Feature, Bug, Technical Debt)
- ✅ Pull request template
- ✅ GitHub Actions workflows (CI/CD, automation)
- ✅ Dependabot configuration
- ✅ Documentation (README, DEVELOPMENT_PROCESS, CONTRIBUTING)
- ✅ CODEOWNERS file

## 🔧 Manual Configuration Required

### 1️⃣ Create GitHub Project Board (5 minutes)

**Why**: Visualize work flow and manage WIP limits

**Steps**:
1. Go to repository: https://github.com/CoforgeInsurance/Kanban-XP-DevProcess
2. Click **Projects** tab → **New project**
3. Choose **Board** layout (not Table)
4. Name it: `Kanban Board`

**Add Columns** (in order):
- **Backlog** - Prioritized work awaiting capacity
- **Ready** - Issues with clear acceptance criteria
- **In Progress** - Active development (WIP limit: 1-2 per person)
- **Review** - PR created, awaiting review
- **Done** - Merged and verified

**Add Custom Fields**:
1. Click **⋮** menu (top right) → **Settings**
2. In left sidebar, click **Custom fields**
3. Click **+ New field** and add these three fields:

| Field Name | Type | Options to Add |
|------------|------|----------------|
| Priority | Single select | High, Medium, Low |
| Size | Single select | XS (< 2h), S (2-4h), M (4-8h), L (1-2d), XL (> 2d) |
| Feature Area | Single select | Frontend, Backend, DevOps, Documentation, Testing |

4. Click **Save** for each field

**Configure Project Workflows** (Recommended - 10 minutes):

This is where you maximize automation! Navigate to **⚙️ Workflows** in your project.

**✅ Essential Workflows to Enable:**

1. **Auto-add to project** ⭐ (Critical)
   - Click workflow → **Edit**
   - **Filter**: `is:open` (adds all open issues and PRs)
   - Click **Save and turn on workflow**
   - **Why**: Automatically adds new issues/PRs to your board
   - **Note**: Status is set by "Item added to project" workflow (below)

2. **Auto-add sub-issues to project** ✅ (Keep enabled - has green dot)
   - **Why**: Automatically adds sub-tasks when you break down large issues
   - **Already enabled by default** - no action needed!

3. **Item added to project** ✅ (Keep enabled - has green dot)
   - Should show: **Set value: Status → Backlog**
   - **Why**: Sets initial status for all new items
   - **Already configured** - verify it's enabled!

4. **Auto-close issue** ✅ (Keep enabled - has green dot)
   - **Why**: Auto-closes issues when linked PR merges
   - **Already enabled by default**

5. **Pull request merged** ✅ (Keep enabled - has green dot)
   - Click workflow → **Edit** → Verify: **Status → Done**
   - **Why**: Moves items to Done when PR merges
   - **Already enabled** - just verify status setting

6. **Item closed** ✅ (Keep enabled - has green dot)
   - **Why**: Handles manually closed items
   - **Already enabled by default**

7. **Item reopened** 🔄 (Enable this)
   - Click workflow → **Edit**
   - **Set value**: Status → **Backlog**
   - Click **Save and turn on workflow**
   - **Why**: Returns reopened items back to workflow

8. **Code changes requested** 🔄 (Optional but recommended)
   - Click workflow → **Edit**
   - **Filter**: `is:pr`
   - **Set value**: Status → **In Progress**
   - Click **Save and turn on workflow**
   - **Why**: Moves PR back when reviewer requests changes

9. **Auto-archive items** 🗄️ (Optional - for clean board)
   - Click workflow → **Edit**
   - **When**: Status changes to **Done**
   - **Archive after**: **2 weeks** (recommended) or 1 week
   - Click **Save and turn on workflow**
   - **Why**: Keeps board focused on active work
   - **Note**: Don't use 4 weeks - too long!

**⭕ Optional - Can Skip:**

10. **Code review approved** (Not needed - redundant)
    - **Skip this** - "Pull request merged" already handles completion
    - Leave disabled to avoid confusion

**Expected Workflow Automation:**

```
New Issue/PR Created
    ↓ (Auto-add to project)
Added to Board → Status: Backlog (Item added to project)
    ↓ [Manual] Move to Ready
    ↓ [Manual] Move to In Progress
    ↓ [Manual] Create PR → Status: Review
    ↓ (If changes requested)
Status: In Progress (Code changes requested)
    ↓ (After fixes, re-review)
    ↓ (PR Merged)
Status: Done (Pull request merged)
    ↓ (Auto-archive after 2 weeks)
Archived ✅
```

**Result**: ✅ Track: https://github.com/CoforgeInsurance/Kanban-XP-DevProcess/issues/1

---

### 2️⃣ Configure Branch Protection (3 minutes)

**Why**: Enforce code review and testing before merge

**Steps**:
1. Go to **Settings** → **Branches**
2. Click **Add branch protection rule**
3. Branch name pattern: `main`

**Enable these settings**:
- ✅ **Require a pull request before merging**
  - Required approvals: **1**
  - ✅ Dismiss stale pull request approvals when new commits are pushed
- ✅ **Require status checks to pass before merging**
  - Note: Status checks will appear after first workflow run
  - Search and add: `code-quality` (from CI workflow)
- ✅ **Require conversation resolution before merging**
- ✅ **Require linear history** (optional but recommended)
- ✅ **Include administrators** (enforce rules for everyone)

4. Click **Create** at bottom

**Test**:
- Try creating a branch and PR to verify protections work
- Confirm you can't merge without approval

**Result**: ✅ Track: https://github.com/CoforgeInsurance/Kanban-XP-DevProcess/issues/2

---

### 3️⃣ Enable GitHub Copilot (2 minutes)

**Why**: Enable AI-assisted development and automated PR reviews

**Prerequisites**:
- GitHub Copilot Business or Enterprise subscription
- Organization admin access

**Steps**:
1. **Check Organization Settings** (if applicable):
   - Go to Organization → **Settings** → **Copilot**
   - Ensure Copilot is enabled for the organization
   - Add team members who need access

2. **Enable for Repository**:
   - Repository → **Settings** → **Code security and analysis**
   - Scroll to **GitHub Copilot** section
   - Click **Enable** (if available)

3. **Enable Copilot Reviews** (if available):
   - In same section, enable **Copilot pull request reviews**
   - This allows requesting @github/copilot as reviewer

**Verify**:
- Open VS Code or GitHub Codespaces
- Copilot icon should show "Ready"
- Try getting code suggestions

**If Copilot not available**:
- You can still use this process! Just skip Copilot-specific features
- Manual code review works great too

**Result**: ✅ Track: https://github.com/CoforgeInsurance/Kanban-XP-DevProcess/issues/3

---

### 4️⃣ Configure Repository Settings (2 minutes)

**General Settings**:
1. Go to **Settings** → **General**
2. Configure:
   - ✅ **Allow squash merging** (recommended)
   - ✅ **Automatically delete head branches** (after merge)
   - ❌ **Allow merge commits** (disable for cleaner history)
   - ❌ **Allow rebase merging** (optional)

**Issues**:
1. Ensure **Issues** are enabled
2. Template chooser is automatic (we set this up)

**Pull Requests**:
1. ✅ **Allow auto-merge**
2. ✅ **Automatically delete head branches**

---

### 5️⃣ Create Repository Labels (5 minutes)

**Why**: Better organization and automation

**Navigate to**: **Issues** → **Labels**

**Add these labels** (if not already present):

| Label | Color | Description |
|-------|-------|-------------|
| `copilot-ready` | `#7057ff` | Ready for Copilot SWE agent assignment |
| `needs-refinement` | `#fbca04` | Missing acceptance criteria or details |
| `needs-tests` | `#d93f0b` | Code changes without test coverage |
| `size/XS` | `#00ff00` | < 100 lines changed |
| `size/S` | `#ccff00` | 100-250 lines |
| `size/M` | `#ffff00` | 250-500 lines |
| `size/L` | `#ffcc00` | 500-1000 lines |
| `size/XL` | `#ff0000` | > 1000 lines (should be split) |
| `good-first-issue` | `#7057ff` | Great for newcomers |
| `documentation` | `#0075ca` | Documentation changes |
| `configuration` | `#0e8a16` | Configuration changes |

**Note**: Automation workflows will apply many of these automatically!

---

### 6️⃣ Update CODEOWNERS (2 minutes)

**Why**: Automatic reviewer assignment

**Steps**:
1. Open `CODEOWNERS` file in repository root
2. Replace placeholder teams with your actual GitHub teams:

```
# Default owners
* @CoforgeInsurance/dev-team

# Workflows
/.github/ @CoforgeInsurance/devops-team

# Documentation
*.md @CoforgeInsurance/tech-writers

# Add your specific patterns
/src/frontend/ @CoforgeInsurance/frontend-team
/src/backend/ @CoforgeInsurance/backend-team
```

3. Commit and push changes

**Create GitHub Teams** (if needed):
1. Organization → **Teams** → **New team**
2. Create teams matching CODEOWNERS patterns
3. Add appropriate members

---

### 7️⃣ Customize CI/CD Workflow (10 minutes)

**Why**: Add your tech stack specific tests

**Steps**:
1. Open `.github/workflows/ci.yml`
2. Find your language section (Node.js, Python, Rust, Java, etc.)
3. **Uncomment** the relevant section
4. **Customize** for your project:
   - Package manager (npm, pip, cargo, maven)
   - Test commands
   - Linting tools
   - Coverage reporting

**Example for Node.js**:
```yaml
node-tests:
  name: Node.js Tests
  runs-on: ubuntu-latest
  steps:
    - uses: actions/checkout@v4
    - uses: actions/setup-node@v4
      with:
        node-version: '20.x'
    - run: npm ci
    - run: npm test
    - run: npm run lint
```

5. **Commit and push** - CI will run automatically!

---

## 🎯 Next Steps

### Start Using the Process

1. **Create your first real issue**:
   - Use the issue templates
   - Include clear acceptance criteria (Given/When/Then)
   - Add technical implementation hints
   - Keep it small (< 1 day)

2. **Try the workflow**:
   - Move issue to "Ready" in project board
   - Pull it to "In Progress"
   - Create feature branch
   - Write tests first (TDD)
   - Implement code
   - Open PR using template
   - Get it reviewed
   - Merge and verify

3. **Experiment with Copilot** (if enabled):
   - Create an issue like #4 (calculator example)
   - Label it `copilot-ready`
   - Assign to @github-copilot
   - See what happens! 🤖

### Team Onboarding

1. **Share documentation**:
   - [DEVELOPMENT_PROCESS.md](./DEVELOPMENT_PROCESS.md) - The methodology
   - [CONTRIBUTING.md](./CONTRIBUTING.md) - How to contribute

2. **Hold kickoff meeting**:
   - Walk through Kanban board
   - Explain WIP limits (1-2 per person)
   - Demo TDD/BDD workflow
   - Show issue templates

3. **Start small**:
   - First 1-2 weeks: Focus on process
   - Review cycle times and adjust
   - Refine WIP limits for your team

---

## ✅ Verification Checklist

Before considering setup complete:

- [ ] GitHub Project board created with proper columns
- [ ] Custom fields added (Priority, Size, Feature Area)
- [ ] Branch protection enabled for `main`
- [ ] At least 1 required reviewer configured
- [ ] Status checks required (after first workflow run)
- [ ] GitHub Copilot enabled (if available)
- [ ] Repository labels created
- [ ] CODEOWNERS updated with real teams
- [ ] CI/CD workflow customized for your tech stack
- [ ] First test issue created and completed
- [ ] Team has access to repository
- [ ] Documentation reviewed by team

---

## 📞 Need Help?

**Process Questions**:
- Review [DEVELOPMENT_PROCESS.md](./DEVELOPMENT_PROCESS.md)
- Check [CONTRIBUTING.md](./CONTRIBUTING.md)

**GitHub Setup Issues**:
- [GitHub Docs - Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects)
- [GitHub Docs - Branch Protection](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches)
- [GitHub Copilot Docs](https://docs.github.com/en/copilot)

**Technical Issues**:
- Create an issue in this repository
- Use the appropriate template
- Include clear reproduction steps

---

## 🎉 You're All Set!

Your repository is now configured with:
- ✅ Kanban workflow for flow management
- ✅ XP practices for technical excellence  
- ✅ BDD/TDD for quality-first development
- ✅ GitHub Copilot optimization (if enabled)
- ✅ Automated workflows to reduce manual work

**Start small, deliver continuously, and improve incrementally!** 🚀

---

*Last updated: October 2025*
