$gh = "C:\Users\pankaj.batra\bin\gh.exe"
$repo = "CoforgeInsurance/Kanban-XP-DevProcess"

Write-Host "Creating remaining 16 issues..." -ForegroundColor Cyan

# Seed Data (4 issues)
& $gh issue create --repo $repo --title "Seed Database - Traditions" --label "feature" --body "## Dependencies: Blocked by Migrations + Quote data`n## Acceptance Criteria`n- [ ] All 7 traditions seeded`n## Size: M"
& $gh issue create --repo $repo --title "Seed Database - Philosophers" --label "feature" --body "## Dependencies: Blocked by Migrations + Bios`n## Acceptance Criteria`n- [ ] 27+ philosophers seeded`n## Size: M"
& $gh issue create --repo $repo --title "Seed Database - Quotes" --label "feature" --body "## Dependencies: Blocked by Migrations + All quotes`n## Acceptance Criteria`n- [ ] 200+ quotes seeded`n## Size: L"
& $gh issue create --repo $repo --title "Seed Database - Timeline Events" --label "feature" --body "## Dependencies: Blocked by Migrations + Timeline data`n## Acceptance Criteria`n- [ ] 45+ events seeded`n## Size: M"

# Testing (5 issues)
& $gh issue create --repo $repo --title "Domain Unit Tests" --label "feature" --body "## Acceptance Criteria`n- [ ] Test all entities`n- [ ] 80%+ coverage`n## Size: M"
& $gh issue create --repo $repo --title "Application Unit Tests" --label "feature" --body "## Acceptance Criteria`n- [ ] Test all services`n- [ ] Mocked dependencies`n## Size: L"
& $gh issue create --repo $repo --title "API Integration Tests" --label "feature" --body "## Acceptance Criteria`n- [ ] WebApplicationFactory`n- [ ] All endpoints tested`n## Size: L"
& $gh issue create --repo $repo --title "BDD Tests (SpecFlow)" --label "feature" --body "## Acceptance Criteria`n- [ ] 10+ scenarios`n- [ ] Gherkin files`n## Size: L"
& $gh issue create --repo $repo --title "Performance Tests" --label "feature" --body "## Acceptance Criteria`n- [ ] Load testing 500 req/sec`n## Size: M"

# Deployment (7 issues)
& $gh issue create --repo $repo --title "Dockerfile for API" --label "feature" --body "## Acceptance Criteria`n- [ ] Multi-stage build, .NET 8`n## Size: M"
& $gh issue create --repo $repo --title "Docker Compose Setup" --label "feature" --body "## Acceptance Criteria`n- [ ] API + SQL + Redis`n## Size: M"
& $gh issue create --repo $repo --title "Azure Container Apps" --label "feature" --body "## Acceptance Criteria`n- [ ] Container deployment, HTTPS`n## Size: L"
& $gh issue create --repo $repo --title "Azure SQL Database" --label "feature" --body "## Acceptance Criteria`n- [ ] Cloud database, migrations applied`n## Size: M"
& $gh issue create --repo $repo --title "Azure Static Web Apps (Frontend)" --label "feature" --body "## Acceptance Criteria`n- [ ] Frontend deployed, CI/CD`n## Size: M"
& $gh issue create --repo $repo --title "CI/CD Pipeline" --label "feature" --body "## Acceptance Criteria`n- [ ] Build + Test + Deploy, GitHub Actions`n## Size: L"
& $gh issue create --repo $repo --title "Monitoring and Logging" --label "feature" --body "## Acceptance Criteria`n- [ ] Application Insights, alerts`n## Size: M"

Write-Host "`n✅ Created 16 additional issues!" -ForegroundColor Green

$total = & $gh issue list --repo $repo --limit 100 --json number | ConvertFrom-Json | Measure-Object | Select-Object -ExpandProperty Count
Write-Host "Total issues in repository: $total" -ForegroundColor Yellow
