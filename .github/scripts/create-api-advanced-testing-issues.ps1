# Create remaining issues for Phase 4-9
$gh = "C:\Users\pankaj.batra\bin\gh.exe"
$repo = "CoforgeInsurance/Kanban-XP-DevProcess"

# PHASE 4: API LAYER (8 issues)
Write-Host "`nCreating API Layer issues (Phase 4)..." -ForegroundColor Cyan

$endpoints = @(
    "Traditions", "Philosophers", "Quotes", "Themes", "Practices", "Timeline"
)

foreach ($endpoint in $endpoints) {
    & $gh issue create --repo $repo `
      --title "Implement $endpoint REST API Endpoints" `
      --label "feature,api" `
      --body "## Dependencies`n- **BLOCKED BY**: $endpoint Service`n`n## Acceptance Criteria`n- [ ] GET /api/$($endpoint.ToLower())`n- [ ] GET /api/$($endpoint.ToLower())/{id}`n- [ ] Swagger documentation`n- [ ] Response codes: 200, 404, 500`n`n## Definition of Done`n- [ ] All endpoints implemented`n- [ ] Integration tests pass`n- [ ] Swagger UI shows endpoints`n`n**Size**: M | **Phase**: 4-API" | Out-Null
    Write-Host "Created $endpoint API issue" -ForegroundColor Green
}

# Search API
& $gh issue create --repo $repo --title "Implement Search API Endpoint" --label "feature,api" `
  --body "## Dependencies`n- **BLOCKED BY**: Quote/Philosopher/Tradition Services`n`n## Acceptance Criteria`n- [ ] GET /api/search?q={query}`n- [ ] Search across quotes, philosophers, traditions`n- [ ] Returns unified SearchResultDto`n`n## Definition of Done`n- [ ] Search endpoint implemented`n- [ ] Returns relevant results`n- [ ] Swagger documented`n`n**Size**: L | **Phase**: 4-API" | Out-Null

# Daily Quote API
& $gh issue create --repo $repo --title "Implement Daily Quote API Endpoint" --label "feature,api" `
  --body "## Dependencies`n- **BLOCKED BY**: Quote Service`n`n## Acceptance Criteria`n- [ ] GET /api/quotes/daily`n- [ ] Returns random quote from all traditions`n- [ ] Optional: ?tradition={name} filter`n`n## Definition of Done`n- [ ] Endpoint implemented`n- [ ] Random selection logic works`n- [ ] Swagger documented`n`n**Size**: S | **Phase**: 4-API" | Out-Null

Write-Host "✅ Created 8 API endpoint issues" -ForegroundColor Green

# PHASE 5: ADVANCED FEATURES (6 issues)
Write-Host "`nCreating Advanced Features issues (Phase 5)..." -ForegroundColor Cyan

& $gh issue create --repo $repo --title "Implement Redis Caching Layer" --label "feature,performance" `
  --body "## Dependencies`n- **BLOCKED BY**: All API endpoints`n`n## Acceptance Criteria`n- [ ] Redis configured`n- [ ] Cache quotes, philosophers, traditions`n- [ ] TTL: 1 hour for static content`n- [ ] Cache invalidation strategy`n`n## Definition of Done`n- [ ] Redis integration complete`n- [ ] Performance tests show improvement`n`n**Size**: M | **Phase**: 5-Advanced" | Out-Null

& $gh issue create --repo $repo --title "Add Response Compression Middleware" --label "feature,performance" `
  --body "## Acceptance Criteria`n- [ ] Gzip compression enabled`n- [ ] Compress JSON responses \u003e 1KB`n- [ ] Swagger responses compressed`n`n## Definition of Done`n- [ ] Compression middleware added`n- [ ] Response sizes reduced by 70%+`n`n**Size**: S | **Phase**: 5-Advanced" | Out-Null

& $gh issue create --repo $repo --title "Implement API Rate Limiting" --label "feature,security" `
  --body "## Acceptance Criteria`n- [ ] Rate limit: 100 req/min per IP`n- [ ] HTTP 429 returned when exceeded`n- [ ] Rate limit headers in responses`n`n## Definition of Done`n- [ ] AspNetCoreRateLimit configured`n- [ ] Tests verify rate limiting works`n`n**Size**: S | **Phase**: 5-Advanced" | Out-Null

& $gh issue create --repo $repo --title "Implement Full-Text Search for Quotes" --label "feature,search" `
  --body "## Dependencies`n- **BLOCKED BY**: Search API endpoint`n`n## Acceptance Criteria`n- [ ] SQL Server full-text search enabled`n- [ ] Search quote text, philosopher names, themes`n- [ ] Ranked results by relevance`n`n## Definition of Done`n- [ ] Full-text indexing configured`n- [ ] Search quality tested`n`n**Size**: M | **Phase**: 5-Advanced" | Out-Null

& $gh issue create --repo $repo --title "Create Tradition Comparison API" --label "feature,api" `
  --body "## Dependencies`n- **BLOCKED BY**: Traditions + Themes APIs`n`n## Acceptance Criteria`n- [ ] GET /api/compare?traditions=stoicism,buddhism`n- [ ] Returns side-by-side comparison`n- [ ] Compare core principles, practices, themes`n`n## Definition of Done`n- [ ] Comparison endpoint works`n- [ ] Returns structured comparison data`n`n**Size**: L | **Phase**: 5-Advanced" | Out-Null

& $gh issue create --repo $repo --title "Add Analytics Tracking (Application Insights)" --label "feature,monitoring" `
  --body "## Acceptance Criteria`n- [ ] Application Insights SDK integrated`n- [ ] Track API usage, popular quotes, errors`n- [ ] Custom events for quote views, searches`n`n## Definition of Done`n- [ ] App Insights configured`n- [ ] Telemetry flowing to Azure`n`n**Size**: M | **Phase**: 5-Advanced" | Out-Null

Write-Host "✅ Created 6 Advanced Features issues" -ForegroundColor Green

# PHASE 6: TESTING (5 issues)
Write-Host "`nCreating Testing issues (Phase 6)..." -ForegroundColor Cyan

& $gh issue create --repo $repo --title "Create Domain Layer Unit Tests" --label "testing,unit-tests" `
  --body "## Dependencies`n- **BLOCKED BY**: Domain Entities`n`n## Acceptance Criteria`n- [ ] Tests for all entities`n- [ ] Tests for value objects`n- [ ] Test coverage \u003e 80%`n`n## Definition of Done`n- [ ] xUnit tests created`n- [ ] All entity business logic tested`n`n**Size**: M | **Phase**: 6-Testing" | Out-Null

& $gh issue create --repo $repo --title "Create Application Layer Unit Tests" --label "testing,unit-tests" `
  --body "## Dependencies`n- **BLOCKED BY**: All services`n`n## Acceptance Criteria`n- [ ] Tests for all 6 services`n- [ ] Mocked repositories (Moq)`n- [ ] Test coverage \u003e 80%`n`n## Definition of Done`n- [ ] All service methods tested`n- [ ] Edge cases covered`n`n**Size**: L | **Phase**: 6-Testing" | Out-Null

& $gh issue create --repo $repo --title "Create API Integration Tests" --label "testing,integration-tests" `
  --body "## Dependencies`n- **BLOCKED BY**: All API endpoints`n`n## Acceptance Criteria`n- [ ] WebApplicationFactory tests`n- [ ] Test all endpoints (GET)`n- [ ] In-memory database for tests`n`n## Definition of Done`n- [ ] Integration tests for all endpoints`n- [ ] Tests pass in CI/CD`n`n**Size**: L | **Phase**: 6-Testing" | Out-Null

& $gh issue create --repo $repo --title "Create BDD Feature Tests (SpecFlow)" --label "testing,bdd" `
  --body "## Dependencies`n- **BLOCKED BY**: API endpoints`n`n## Acceptance Criteria`n- [ ] Feature files for user scenarios`n- [ ] Step definitions implemented`n- [ ] Tests pass with SpecFlow runner`n`n## Definition of Done`n- [ ] 10+ BDD scenarios implemented`n- [ ] All scenarios green`n`n**Size**: L | **Phase**: 6-Testing" | Out-Null

& $gh issue create --repo $repo --title "Create Performance \u0026 Load Tests" --label "testing,performance" `
  --body "## Dependencies`n- **BLOCKED BY**: Caching/Optimization complete`n`n## Acceptance Criteria`n- [ ] k6 or Apache Bench load tests`n- [ ] Target: 500 req/sec`n- [ ] Latency p95 \u003c 200ms`n`n## Definition of Done`n- [ ] Load test scripts created`n- [ ] Performance targets met`n`n**Size**: M | **Phase**: 6-Testing" | Out-Null

Write-Host "✅ Created 5 Testing issues" -ForegroundColor Green

Write-Host "`n🎉 Issue creation script complete!" -ForegroundColor Green
Write-Host "Total issues created in this batch: 25" -ForegroundColor Yellow
Write-Host "Next: Run create-frontend-deployment-issues.ps1 for remaining ~20 issues" -ForegroundColor Cyan
