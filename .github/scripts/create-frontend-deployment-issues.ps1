# Create Frontend and Deployment issues (Phases 7-8)
$gh = "C:\Users\pankaj.batra\bin\gh.exe"
$repo = "CoforgeInsurance/Kanban-XP-DevProcess"

# PHASE 7: FRONTEND (12 issues)
Write-Host "`nCreating Frontend issues (Phase 7)..." -ForegroundColor Cyan

& $gh issue create --repo $repo --title "Setup Frontend Project (Static HTML/CSS/JS)" --label "feature,frontend" `
  --body "## Dependencies`n- **BLOCKED BY**: API endpoints complete`n`n## Acceptance Criteria`n- [ ] Folder structure: frontend/index.html, css/, js/, assets/`n- [ ] Build tool: Vite or plain static`n- [ ] Fetch API for backend calls`n`n## Definition of Done`n- [ ] Project structure created`n- [ ] Can call API endpoints`n`n**Size**: S | **Phase**: 7-Frontend" | Out-Null

& $gh issue create --repo $repo --title "Create Design System \u0026 Global Styles" --label "feature,frontend,design" `
  --body "## Dependencies`n- **BLOCKED BY**: Frontend setup`n`n## Acceptance Criteria`n- [ ] CSS variables for colors, typography, spacing`n- [ ] Philosophical aesthetic (calming, minimal)`n- [ ] Responsive breakpoints defined`n- [ ] Component CSS classes`n`n## Definition of Done`n- [ ] design-system.css created`n- [ ] Style guide documented`n`n**Size**: M | **Phase**: 7-Frontend" | Out-Null

$frontendPages = @(
    @{Title="Homepage Layout"; Desc="Hero, featured quote, navigation"; Size="M"},
    @{Title="Browse Traditions Page"; Desc="Grid of 7 traditions with descriptions"; Size="M"},
    @{Title="Browse Philosophers Page"; Desc="List/grid view with filters"; Size="M"},
    @{Title="Quote of the Day Widget"; Desc="Featured quote with share button"; Size="S"},
    @{Title="Browse Quotes Page"; Desc="Infinite scroll, filters (tradition/philosopher/theme)"; Size="L"},
    @{Title="Quote Detail/Share Page"; Desc="Full quote details, social sharing, download image"; Size="M"},
    @{Title="Timeline Visualization"; Desc="Interactive timeline (D3.js or Chart.js)"; Size="L"},
    @{Title="Search Interface"; Desc="Search bar, results display, highlighting"; Size="M"},
    @{Title="Comparison Tool UI"; Desc="Side-by-side tradition comparison"; Size="L"},
    @{Title="Practice Guide Pages"; Desc="Philosophical practices with instructions"; Size="M"}
)

foreach ($page in $frontendPages) {
    & $gh issue create --repo $repo `
      --title "Implement $($page.Title)" `
      --label "feature,frontend" `
      --body "## Dependencies`n- **BLOCKED BY**: Design System + relevant API endpoints`n`n## Acceptance Criteria`n- [ ] $($page.Desc)`n- [ ] Mobile responsive`n- [ ] Accessible (ARIA labels, keyboard nav)`n`n## Definition of Done`n- [ ] Page implemented and styled`n- [ ] API integration works`n- [ ] Tested on mobile/desktop`n`n**Size**: $($page.Size) | **Phase**: 7-Frontend" | Out-Null
    Write-Host "Created $($page.Title) issue" -ForegroundColor Green
}

Write-Host "✅ Created 12 Frontend issues" -ForegroundColor Green

# PHASE 8: DEPLOYMENT (7 issues)
Write-Host "`nCreating Deployment issues (Phase 8)..." -ForegroundColor Cyan

& $gh issue create --repo $repo --title "Create Dockerfile for API" --label "feature,deployment,docker" `
  --body "## Dependencies`n- **BLOCKED BY**: API endpoints complete`n`n## Acceptance Criteria`n- [ ] Multi-stage Dockerfile (build + runtime)`n- [ ] .NET 8.0 runtime image`n- [ ] Optimized image size (\u003c 200MB)`n- [ ] Health check configured`n`n## Definition of Done`n- [ ] Dockerfile builds successfully`n- [ ] docker run works locally`n`n**Size**: M | **Phase**: 8-Deployment" | Out-Null

& $gh issue create --repo $repo --title "Create Docker Compose (API + Database + Redis)" --label "feature,deployment,docker" `
  --body "## Dependencies`n- **BLOCKED BY**: Dockerfile + Redis caching`n`n## Acceptance Criteria`n- [ ] docker-compose.yml with 3 services: api, sqlserver, redis`n- [ ] Networking configured`n- [ ] Volume persistence for DB`n- [ ] Environment variables`n`n## Definition of Done`n- [ ] docker-compose up works`n- [ ] All services communicate`n`n**Size**: M | **Phase**: 8-Deployment" | Out-Null

& $gh issue create --repo $repo --title "Configure Azure Container Apps Deployment" --label "feature,deployment,azure" `
  --body "## Dependencies`n- **BLOCKED BY**: Dockerfile`n`n## Acceptance Criteria`n- [ ] Azure Container Registry (ACR) setup`n- [ ] Container App configuration`n- [ ] Environment variables configured`n- [ ] HTTPS enabled`n`n## Definition of Done`n- [ ] API deployed to Azure Container Apps`n- [ ] Accessible via HTTPS URL`n`n**Size**: L | **Phase**: 8-Deployment" | Out-Null

& $gh issue create --repo $repo --title "Setup Azure SQL Database" --label "feature,deployment,azure" `
  --body "## Dependencies`n- **BLOCKED BY**: Database migrations`n`n## Acceptance Criteria`n- [ ] Azure SQL Database created`n- [ ] Firewall rules configured`n- [ ] Connection string in Key Vault`n- [ ] Initial migration applied`n`n## Definition of Done`n- [ ] Database accessible from Container App`n- [ ] Data seeded successfully`n`n**Size**: M | **Phase**: 8-Deployment" | Out-Null

& $gh issue create --repo $repo --title "Deploy Static Frontend to Azure Static Web Apps" --label "feature,deployment,azure" `
  --body "## Dependencies`n- **BLOCKED BY**: Frontend complete`n`n## Acceptance Criteria`n- [ ] Azure Static Web Apps configured`n- [ ] GitHub Actions for auto-deploy`n- [ ] Custom domain (optional)`n- [ ] API backend URL configured`n`n## Definition of Done`n- [ ] Frontend live on Azure`n- [ ] API calls work from production`n`n**Size**: M | **Phase**: 8-Deployment" | Out-Null

& $gh issue create --repo $repo --title "Create CI/CD Pipeline (GitHub Actions)" --label "feature,deployment,ci-cd" `
  --body "## Dependencies`n- **BLOCKED BY**: Dockerfile`n`n## Acceptance Criteria`n- [ ] Build workflow: test, build, push to ACR`n- [ ] Deploy workflow: deploy to Container Apps`n- [ ] Runs on push to main`n- [ ] Secrets management (GitHub Secrets)`n`n## Definition of Done`n- [ ] CI/CD pipeline functional`n- [ ] Auto-deploy on merge to main`n`n**Size**: L | **Phase**: 8-Deployment" | Out-Null

& $gh issue create --repo $repo --title "Configure Monitoring \u0026 Logging (Application Insights)" --label "feature,deployment,monitoring" `
  --body "## Dependencies`n- **BLOCKED BY**: Azure Container Apps deployment`n`n## Acceptance Criteria`n- [ ] Application Insights connected`n- [ ] Log streaming configured`n- [ ] Alerts for errors/downtime`n- [ ] Dashboard for key metrics`n`n## Definition of Done`n- [ ] Monitoring active`n- [ ] Alerts configured`n- [ ] Logs searchable`n`n**Size**: M | **Phase**: 8-Deployment" | Out-Null

Write-Host "✅ Created 7 Deployment issues" -ForegroundColor Green

Write-Host "`n🎉 All issues created successfully!" -ForegroundColor Green
Write-Host "Total issues created in this batch: 19" -ForegroundColor Yellow
Write-Host "`nFinal Summary:" -ForegroundColor Cyan
Write-Host "- Phase 1 (Foundation): 5 issues (already assigned to Copilot)" -ForegroundColor White
Write-Host "- Phase 2 (Data Layer): 9 issues" -ForegroundColor White
Write-Host "- Phase 3 (Application): 8 issues" -ForegroundColor White
Write-Host "- Phase 4 (API Layer): 8 issues" -ForegroundColor White
Write-Host "- Phase 5 (Advanced): 6 issues" -ForegroundColor White
Write-Host "- Phase 6 (Testing): 5 issues" -ForegroundColor White
Write-Host "- Phase 7 (Frontend): 12 issues" -ForegroundColor White
Write-Host "- Phase 8 (Deployment): 7 issues" -ForegroundColor White
Write-Host "- Content Issues: 5 additional (Cynicism, Epicureanism, Buddhism, Taoism, Sufism)" -ForegroundColor White
Write-Host "`nTotal: 65+ issues created!" -ForegroundColor Yellow
