# Create ALL remaining issues for Ancient Wisdom API
# This script creates issues #23 onwards to reach the target of 77 total issues

$gh = "C:\Users\pankaj.batra\bin\gh.exe"
$repo = "CoforgeInsurance/Kanban-XP-DevProcess"

$issuesCreated = 0

Write-Host "Starting bulk issue creation..." -ForegroundColor Cyan
Write-Host "Target: Create ~60 remaining issues" -ForegroundColor Yellow
Write-Host ""

# Helper function to create issue and count
function Create-Issue {
    param(
        [string]$Title,
        [string]$Body,
        [string]$Labels = "feature"
    )
    
    try {
        $result = & $gh issue create --repo $repo --title $Title --label $Labels --body $Body 2>&1
        if ($LASTEXITCODE -eq 0) {
            $script:issuesCreated++
            Write-Host "✓ Created: $Title" -ForegroundColor Green
            return $true
        } else {
            Write-Host "✗ Failed: $Title - $result" -ForegroundColor Red
            return $false
        }
    } catch {
        Write-Host "✗ Error creating: $Title - $_" -ForegroundColor Red
        return $false
    }
}

# Domain Layer (already created #23, now create #24-25)
Write-Host "`n=== PHASE 1: Domain Layer ===" -ForegroundColor Cyan

Create-Issue -Title "Create Domain Value Objects and Enums" -Body @"
## Dependencies
- Blocked by: #7 (Domain Entities)

## Acceptance Criteria
- [ ] DifficultyLevel enum
- [ ] PracticeFrequency enum
- [ ] EventType enum
- [ ] TimeRange value object
- [ ] All immutable

## Size: S | Phase: 1-Domain
"@

# Infrastructure Layer
Write-Host "`n=== PHASE 2: Infrastructure/Data Layer ===" -ForegroundColor Cyan

Create-Issue -Title "Create EF Core Entity Configurations" -Body @"
## Dependencies
- Blocked by: #7

## Acceptance Criteria
- [ ] Configurations for all 8 entities
- [ ] Fluent API (not attributes)
- [ ] Relationships configured
- [ ] Indexes defined

## Size: M | Phase: 2-Infrastructure
"@

Create-Issue -Title "Create Initial Database Migration" -Body @"
## Dependencies
- Blocked by: EF Core Configurations

## Acceptance Criteria
- [ ] Initial migration created
- [ ] Applies successfully
- [ ] All tables, relationships created

## Size: S | Phase: 2-Infrastructure
"@

Create-Issue -Title "Implement Repository Pattern" -Body @"
## Dependencies
- Blocked by: EF Core Configurations

## Acceptance Criteria
- [ ] GenericRepository<T>
- [ ] 6 specific repositories
- [ ] Async/await throughout
- [ ] Custom query methods

## Size: L | Phase: 2-Infrastructure
"@

# Seed Data Issues
Create-Issue -Title "Seed Database - Traditions" -Body "## Dependencies`n- Blocked by: Migrations + Quote data (#9, #10, #17, #19-#22)`n`n## Acceptance Criteria`n- [ ] All 7 traditions seeded`n`n## Size: M" -Labels "feature,data"

Create-Issue -Title "Seed Database - Philosophers" -Body "## Dependencies`n- Blocked by: Migrations + Bios (#11)`n`n## Acceptance Criteria`n- [ ] 27+ philosophers seeded`n`n## Size: M" -Labels "feature,data"

Create-Issue -Title "Seed Database - Quotes" -Body "## Dependencies`n- Blocked by: Migrations + All quote data`n`n## Acceptance Criteria`n- [ ] 200+ quotes seeded`n- [ ] Quote-Theme relationships`n`n## Size: L" -Labels "feature,data"

Create-Issue -Title "Seed Database - Timeline Events" -Body "## Dependencies`n- Blocked by: Migrations + Timeline (#12)`n`n## Acceptance Criteria`n- [ ] 45+ events seeded`n`n## Size: M" -Labels "feature,data"

# Application Layer
Write-Host "`n=== PHASE 3: Application Layer ===" -ForegroundColor Cyan

Create-Issue -Title "Create Application DTOs" -Body "## Dependencies`n- Blocked by: Domain Entities`n`n## Acceptance Criteria`n- [ ] DTOs for all entities`n- [ ] Request/Response DTOs`n`n## Size: M"

Create-Issue -Title "Create AutoMapper Profiles" -Body "## Dependencies`n- Blocked by: DTOs`n`n## Acceptance Criteria`n- [ ] Entity → DTO mappings`n- [ ] Custom mappings`n`n## Size: S"

$services = @("Tradition", "Philosopher", "Quote", "Theme", "Practice", "Timeline")
foreach ($svc in $services) {
    Create-Issue -Title "Implement $svc Service" -Body "## Dependencies`n- Blocked by: Repositories + DTOs`n`n## Acceptance Criteria`n- [ ] I$($svc)Service interface`n- [ ] $($svc)Service implementation`n- [ ] Unit tests`n`n## Size: M"
}

# API Layer
Write-Host "`n=== PHASE 4: API Endpoints ===" -ForegroundColor Cyan

$endpoints = @("Traditions", "Philosophers", "Quotes", "Themes", "Practices", "Timeline")
foreach ($endpoint in $endpoints) {
    Create-Issue -Title "$endpoint API Endpoints" -Body "## Dependencies`n- Blocked by: $endpoint Service`n`n## Acceptance Criteria`n- [ ] GET /api/$($endpoint.ToLower())`n- [ ] GET /api/$($endpoint.ToLower())/{id}`n- [ ] Swagger docs`n`n## Size: M"
}

Create-Issue -Title "Search API Endpoint" -Body "## Dependencies`n- Blocked by: Core services`n`n## Acceptance Criteria`n- [ ] GET /api/search?q={query}`n- [ ] Search across types`n`n## Size: L"

Create-Issue -Title "Daily Quote API Endpoint" -Body "## Dependencies`n- Blocked by: Quote Service`n`n## Acceptance Criteria`n- [ ] GET /api/quotes/daily`n- [ ] Random selection`n`n## Size: S"

# Advanced Features
Write-Host "`n=== PHASE 5: Advanced Features ===" -ForegroundColor Cyan

Create-Issue -Title "Redis Caching Layer" -Body "## Dependencies`n- Blocked by: All APIs`n`n## Acceptance Criteria`n- [ ] Redis configured`n- [ ] Cache strategy`n`n## Size: M"

Create-Issue -Title "Response Compression" -Body "## Acceptance Criteria`n- [ ] Gzip compression`n- [ ] 70%+ size reduction`n`n## Size: S"

Create-Issue -Title "API Rate Limiting" -Body "## Acceptance Criteria`n- [ ] 100 req/min limit`n- [ ] HTTP 429 responses`n`n## Size: S"

Create-Issue -Title "Full-Text Search" -Body "## Dependencies`n- Blocked by: Search API`n`n## Acceptance Criteria`n- [ ] SQL Server full-text`n- [ ] Ranked results`n`n## Size: M"

Create-Issue -Title "Tradition Comparison API" -Body "## Dependencies`n- Blocked by: Traditions + Themes APIs`n`n## Acceptance Criteria`n- [ ] Side-by-side comparison`n`n## Size: L"

Create-Issue -Title "Analytics Tracking" -Body "## Acceptance Criteria`n- [ ] Application Insights`n- [ ] Custom telemetry`n`n## Size: M"

# Testing
Write-Host "`n=== PHASE 6: Testing ===" -ForegroundColor Cyan

Create-Issue -Title "Domain Unit Tests" -Body "## Acceptance Criteria`n- [ ] Test all entities`n- [ ] 80%+ coverage`n`n## Size: M" -Labels "testing"

Create-Issue -Title "Application Unit Tests" -Body "## Acceptance Criteria`n- [ ] Test all services`n- [ ] Mocked dependencies`n`n## Size: L" -Labels "testing"

Create-Issue -Title "API Integration Tests" -Body "## Acceptance Criteria`n- [ ] WebApplicationFactory`n- [ ] All endpoints tested`n`n## Size: L" -Labels "testing"

Create-Issue -Title "BDD Tests (SpecFlow)" -Body "## Acceptance Criteria`n- [ ] 10+ scenarios`n- [ ] Gherkin feature files`n`n## Size: L" -Labels "testing"

Create-Issue -Title "Performance Tests" -Body "## Acceptance Criteria`n- [ ] Load testing`n- [ ] 500 req/sec target`n`n## Size: M" -Labels "testing"

# Frontend
Write-Host "`n=== PHASE 7: Frontend ===" -ForegroundColor Cyan

Create-Issue -Title "Frontend Project Setup" -Body "## Dependencies`n- Blocked by: APIs ready`n`n## Acceptance Criteria`n- [ ] Static site structure`n- [ ] Vite/plain setup`n`n## Size: S"

Create-Issue -Title "Design System \u0026 Styles" -Body "## Acceptance Criteria`n- [ ] CSS variables`n- [ ] Responsive design`n`n## Size: M"

$pages = @(
    "Homepage Layout",
    "Browse Traditions Page",
    "Browse Philosophers Page", 
    "Quote of the Day Widget",
    "Browse Quotes Page",
    "Quote Detail Page",
    "Timeline Visualization",
    "Search Interface",
    "Comparison Tool UI",
    "Practice Guide Pages"
)

foreach ($page in $pages) {
    Create-Issue -Title $page -Body "## Dependencies`n- Blocked by: Design System + APIs`n`n## Acceptance Criteria`n- [ ] Responsive layout`n- [ ] API integration`n`n## Size: M"
}

# Deployment
Write-Host "`n=== PHASE 8: Deployment ===" -ForegroundColor Cyan

Create-Issue -Title "Dockerfile for API" -Body "## Acceptance Criteria`n- [ ] Multi-stage build`n- [ ] .NET 8 runtime`n`n## Size: M" -Labels "deployment"

Create-Issue -Title "Docker Compose Setup" -Body "## Acceptance Criteria`n- [ ] API + SQL + Redis`n- [ ] Networking configured`n`n## Size: M" -Labels "deployment"

Create-Issue -Title "Azure Container Apps" -Body "## Acceptance Criteria`n- [ ] Container deployment`n- [ ] HTTPS enabled`n`n## Size: L" -Labels "deployment"

Create-Issue -Title "Azure SQL Database" -Body "## Acceptance Criteria`n- [ ] Cloud database setup`n- [ ] Migrations applied`n`n## Size: M" -Labels "deployment"

Create-Issue -Title "Azure Static Web Apps (Frontend)" -Body "## Acceptance Criteria`n- [ ] Frontend deployed`n- [ ] GitHub Actions CI/CD`n`n## Size: M" -Labels "deployment"

Create-Issue -Title "CI/CD Pipeline" -Body "## Acceptance Criteria`n- [ ] Build + Test + Deploy`n- [ ] Auto-deploy on merge`n`n## Size: L" -Labels "deployment"

Create-Issue -Title "Monitoring \u0026 Logging" -Body "## Acceptance Criteria`n- [ ] Application Insights`n- [ ] Alerts configured`n`n## Size: M" -Labels "deployment"

Write-Host "`n" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Green
Write-Host "🎉 Issue Creation Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host "Total issues created: $issuesCreated" -ForegroundColor Yellow
Write-Host "" 

# Verify final count
$totalIssues = & $gh issue list --repo $repo --limit 100 --json number | ConvertFrom-Json | Measure-Object | Select-Object -ExpandProperty Count
Write-Host "Total issues now in repository: $totalIssues" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:" -ForegroundColor White
Write-Host "1. Review issue list: gh issue list --repo $repo --limit 100" -ForegroundColor Gray
Write-Host "2. Update dependency map with actual issue numbers" -ForegroundColor Gray
Write-Host "3. Assign parallel-safe issues to Copilot (#18-#22)" -ForegroundColor Gray
