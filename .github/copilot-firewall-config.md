# GitHub Copilot Agent Firewall Configuration

## Problem
The Copilot agent is being blocked by GitHub Actions firewall rules, causing timeouts when trying to:
- Access AI model APIs
- Generate content
- Make HTTP requests

## Solution: Configure Firewall Allow List

### Step 1: Access Repository Settings
1. Go to your repository: https://github.com/CoforgeInsurance/Kanban-XP-DevProcess
2. Click **Settings** → **Actions** → **General**

### Step 2: Configure Copilot Agent Network Access
You need to add the following to your firewall allow list:

#### Required URLs/Domains:
```
# GitHub Copilot API endpoints
*.github.com
api.github.com
*.githubusercontent.com

# AI Model endpoints (GitHub's backend)
*.openai.azure.com
*.azure.com

# General GitHub infrastructure
github.githubassets.com
```

### Step 3: Update Repository Settings

#### Option A: Via GitHub UI
1. Go to **Settings** → **Code security and analysis**
2. Scroll to **GitHub Actions permissions**
3. Look for **Copilot** or **Firewall** settings
4. Add the URLs above to the allow list

#### Option B: Via .github/copilot.yml Configuration
Create or update `.github/copilot.yml`:

```yaml
# Copilot agent configuration
agent:
  network:
    allow:
      - "*.github.com"
      - "api.github.com"
      - "*.githubusercontent.com"
      - "*.openai.azure.com"
      - "*.azure.com"
      - "github.githubassets.com"
  
  timeout:
    # Increase timeout for large content generation tasks
    default: 600  # 10 minutes (default is usually 5 minutes)
    
  retry:
    max_attempts: 3
    backoff_factor: 2
```

### Step 4: Alternative Solution - Split Large Tasks

For the immediate Cynicism quotes issue (#18), you can also work around this by **splitting the task** into smaller chunks:

1. **Close the current PR #18** (the agent has already created the branch)
2. **Manually modify the issue** to request fewer quotes at a time:
   - Issue #18a: "Create 20 Cynicism quotes (Part 1)"
   - Issue #18b: "Create remaining 22+ Cynicism quotes (Part 2)"

This prevents timeout by reducing the response size.

### Step 5: Retry the Failed Job

After configuring firewall rules:

1. Go to PR #18: https://github.com/CoforgeInsurance/Kanban-XP-DevProcess/pull/18
2. Add a comment: `@github-actions retry`
3. Or close and re-open the issue to trigger a new agent assignment

## Quick Fix for PR #18

Since the agent already created the directory structure, you can **manually complete the file**:

```bash
# 1. Checkout the branch
git fetch origin copilot/create-cynicism-quotes-dataset
git checkout copilot/create-cynicism-quotes-dataset

# 2. Create the file manually (or copy from template)
# Edit: content/quotes/cynicism.json

# 3. Commit and push
git add content/quotes/cynicism.json
git commit -m "Add Cynicism quotes dataset"
git push origin copilot/create-cynicism-quotes-dataset
```

Then the PR will be ready for review.

## Prevention

To prevent this in future:

1. ✅ Configure firewall allow list (above)
2. ✅ Keep content generation tasks focused (20-30 items max per request)
3. ✅ Consider increasing workflow timeout in issue templates
4. ✅ Monitor agent job logs for firewall warnings

## Documentation Links

- [GitHub Actions Firewall Config](https://gh.io/copilot/firewall-config)
- [Copilot Actions Setup Steps](https://gh.io/copilot/actions-setup-steps)
- [GitHub Copilot Agent Documentation](https://docs.github.com/en/copilot/using-github-copilot/using-github-copilot-agents)
