# Create Application Layer issues (Phase 3)
$gh = "C:\Users\pankaj.batra\bin\gh.exe"
$repo = "CoforgeInsurance/Kanban-XP-DevProcess"

Write-Host "`nCreating Application Layer issues (Phase 3)..." -ForegroundColor Cyan

# DTOs
& $gh issue create --repo $repo --title "Create Application Layer DTOs (Data Transfer Objects)" --label "feature,application" `
  --body "## Dependencies`n- **BLOCKED BY**: Domain Entities (#7)`n`n## Acceptance Criteria`n- [ ] TraditionDto, PhilosopherDto, QuoteDto, ThemeDto, PracticeDto, TimelineEventDto`n- [ ] Request/Response DTOs for all operations`n- [ ] Located in AncientWisdom.Application/DTOs/`n`n## Definition of Done`n- [ ] All DTOs created`n- [ ] Validation attributes applied`n- [ ] XML documentation complete`n`n**Size**: M | **Phase**: 3-Application"

# AutoMapper
& $gh issue create --repo $repo --title "Create AutoMapper Mapping Profiles" --label "feature,application" `
  --body "## Dependencies`n- **BLOCKED BY**: Application DTOs issue`n`n## Acceptance Criteria`n- [ ] MappingProfile class created`n- [ ] Entity → DTO mappings`n- [ ] DTO → Entity mappings`n- [ ] Custom mappings for complex properties`n`n## Definition of Done`n- [ ] All mappings configured`n- [ ] Mapping tests pass`n- [ ] Located in Application/Mappings/`n`n**Size**: S | **Phase**: 3-Application"

# Services (6 total)
$services = @(
    @{Name="Tradition"; Desc="Browse traditions, get details"; Priority="High"},
    @{Name="Philosopher"; Desc="Browse philosophers, filter by tradition"; Priority="High"},
    @{Name="Quote"; Desc="Get quotes, filter by philosopher/theme/tradition, random quote"; Priority="High"},
    @{Name="Theme"; Desc="Browse themes, get quotes by theme"; Priority="Medium"},
    @{Name="Practice"; Desc="Get philosophical practices"; Priority="Medium"},
    @{Name="Timeline"; Desc="Get timeline events, filter by tradition/period"; Priority="Medium"}
)

foreach ($svc in $services) {
    & $gh issue create --repo $repo `
      --title "Implement $($svc.Name) Application Service" `
      --label "feature,application" `
      --body @"
## Dependencies
- **BLOCKED BY**: Repository Pattern + Application DTOs issues

## Acceptance Criteria
### Scenario 1: Interface defined
- [ ] I$($svc.Name)Service interface in Application/Interfaces/
- [ ] All query methods defined (Get, GetAll, GetByXxx)

### Scenario 2: Implementation
- [ ] $($svc.Name)Service class in Application/Services/
- [ ] Uses repository via DI
- [ ] Maps entities to DTOs via AutoMapper
- [ ] Async/await pattern

### Scenario 3: Business logic
- [ ] $($svc.Desc)
- [ ] Error handling with proper exceptions
- [ ] Logging integrated

## Definition of Done
- [ ] Service interface and implementation created
- [ ] Unit tests for all methods
- [ ] Registered in DI container
- [ ] Documentation complete

**Priority**: $($svc.Priority) | **Size**: M | **Phase**: 3-Application
"@
    Write-Host "Created $($svc.Name) Service issue" -ForegroundColor Green
}

Write-Host "`n✅ Created Application Layer issues (8 total)" -ForegroundColor Green
