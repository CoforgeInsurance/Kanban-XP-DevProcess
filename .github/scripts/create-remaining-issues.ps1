# Script to create remaining GitHub issues for Ancient Wisdom API project
# Total target: 77 issues
# Currently created: 14 (Issues #1-#22, with some gaps)
# Remaining to create: 63 issues

$gh = "C:\Users\pankaj.batra\bin\gh.exe"
$repo = "CoforgeInsurance/Kanban-XP-DevProcess"

# Phase 2: Domain Layer Issues (#23-#25)
# Note: Issue numbers won't match exactly due to existing issues, but content will be correct

Write-Host "Creating Domain Layer issues..." -ForegroundColor Cyan

# Issue: Domain Interfaces
& $gh issue create --repo $repo `
  --title "Create Domain Layer Interfaces" `
  --label "feature,blocked,domain" `
  --body @"
# Issue: Create Domain Layer Interfaces

## User Story
As a developer
I want domain layer interfaces defined
So that application and infrastructure layers can depend on abstractions

## Dependencies
- **BLOCKED BY**: Issue #7 (Domain Entities must be complete first)

## Acceptance Criteria
### Scenario 1: Repository interfaces defined
- [ ] IRepository<T> generic interface
- [ ] ITraditionRepository with custom methods
- [ ] IPhilosopherRepository
- [ ] IQuoteRepository
- [ ] All interfaces in AncientWisdom.Domain/Interfaces/

### Scenario 2: Service interfaces defined
- [ ] ITraditionService
- [ ] IPhilosopherService
- [ ] IQuoteService
- [ ] IThemeService
- [ ] IPracticeService
- [ ] ITimelineService

## Definition of Done
- [ ] All repository interfaces created
- [ ] All service interfaces created
- [ ] Zero external dependencies (pure C#)
- [ ] XML documentation on all public members
- [ ] Follows repository pattern best practices

**Priority**: High | **Size**: S | **Phase**: 1-Domain
"@

Write-Host "Created Domain Interfaces issue" -ForegroundColor Green

# Issue: Value Objects & Enums
& $gh issue create --repo $repo `
  --title "Create Domain Value Objects and Enums" `
  --label "feature,blocked,domain" `
  --body @"
# Issue: Create Domain Value Objects and Enums

## User Story
As a developer
I want value objects and enums defined in the domain layer
So that domain logic uses strongly-typed, immutable value types

## Dependencies
- **BLOCKED BY**: Issue #7 (Domain Entities)

## Acceptance Criteria
### Scenario 1: Enums defined
- [ ] DifficultyLevel enum (Beginner, Intermediate, Advanced)
- [ ] PracticeFrequency enum (Daily, Weekly, Monthly, Occasional)
- [ ] EventType enum (Birth, Death, WorkPublished, TeachingEvent, HistoricalMilestone)

### Scenario 2: Value objects created
- [ ] TimeRange value object (birth year, death year)
- [ ] QuoteAttribution value object (source, context)
- [ ] HistoricalPeriod value object (era, region)

## Definition of Done
- [ ] All enums created with XML documentation
- [ ] All value objects immutable (records or readonly classes)
- [ ] Value object equality implemented
- [ ] Located in AncientWisdom.Domain/ValueObjects/ and /Enums/
- [ ] Zero external dependencies

**Priority**: High | **Size**: S | **Phase**: 1-Domain
"@

Write-Host "Created Value Objects \u0026 Enums issue" -ForegroundColor Green

# Phase 3: Infrastructure - Database Issues

Write-Host "`nCreating Infrastructure/Database issues..." -ForegroundColor Cyan

# Issue: EF Core Configurations
& $gh issue create --repo $repo `
  --title "Create EF Core Entity Configurations" `
  --label "feature,blocked,infrastructure" `
  --body @"
# Issue: Create EF Core Entity Configurations

## User Story
As a developer
I want EF Core entity configurations defined
So that database schema is properly configured with fluent API

## Dependencies
- **BLOCKED BY**: Issue #7 (Domain Entities) must be complete

## Acceptance Criteria
### Scenario 1: All entity configurations created
- [ ] TraditionConfiguration
- [ ] PhilosopherConfiguration
- [ ] QuoteConfiguration
- [ ] ThemeConfiguration
- [ ] ThemePerspectiveConfiguration
- [ ] PracticeConfiguration
- [ ] TimelineEventConfiguration
- [ ] QuoteThemeConfiguration (many-to-many join table)

### Scenario 2: Fluent API configurations include
- [ ] Primary keys
- [ ] Required fields and max lengths
- [ ] Indexes (on frequently queried fields)
- [ ] Relationships and navigation properties
- [ ] Cascade delete rules
- [ ] Default values where appropriate

## Definition of Done
- [ ] All 8 entity configurations created
- [ ] Located in Infrastructure/Data/Configurations/
- [ ] Fluent API used (not attributes)
- [ ] OnModelCreating applies all configurations
- [ ] Follows EF Core best practices

**Priority**: High | **Size**: M | **Phase**: 2-Data
"@

Write-Host "Created EF Core Configurations issue" -ForegroundColor Green

# Issue: Database Migrations
& $gh issue create --repo $repo `
  --title "Create Initial Database Migration" `
  --label "feature,blocked,infrastructure" `
  --body @"
# Issue: Create Initial Database Migration

## User Story
As a developer
I want the initial EF Core migration created
So that the database schema can be generated

## Dependencies
- **BLOCKED BY**: EF Core Configurations issue (must be complete first)

## Acceptance Criteria
### Scenario 1: Migration created successfully
- [ ] Initial migration generated via Add-Migration
- [ ] Migration creates all 8 tables
- [ ] All constraints, indexes, relationships included
- [ ] Migration applies cleanly (Update-Database succeeds)

### Scenario 2: Migration script reviewed
- [ ] SQL script generated and reviewed
- [ ] No SQL injection vulnerabilities
- [ ] Indexes on appropriate columns
- [ ] Foreign keys properly configured

## Definition of Done
- [ ] Migration files in Infrastructure/Migrations/
- [ ] Database Update-Database runs successfully
- [ ] SQL script reviewed for correctness
- [ ] Database schema matches domain model

**Priority**: High | **Size**: S | **Phase**: 2-Data
"@

Write-Host "Created Database Migrations issue" -ForegroundColor Green

# Issue: Repository Pattern Implementation
& $gh issue create --repo $repo `
  --title "Implement Repository Pattern (All Repositories)" `
  --label "feature,blocked,infrastructure" `
  --body @"
# Issue: Implement Repository Pattern

## User Story
As a developer
I want repositories implemented following the pattern
So that data access is abstracted from business logic

## Dependencies
- **BLOCKED BY**: EF Core Configurations issue

## Acceptance Criteria
### Scenario 1: Generic repository implemented
- [ ] GenericRepository<T> base class
- [ ] CRUD operations: GetByIdAsync, GetAllAsync, AddAsync, UpdateAsync, DeleteAsync
- [ ] Async/await pattern used throughout

### Scenario 2: Specific repositories implemented
- [ ] TraditionRepository : GenericRepository<Tradition>
- [ ] PhilosopherRepository : GenericRepository<Philosopher>
- [ ] QuoteRepository : GenericRepository<Quote>
- [ ] ThemeRepository : GenericRepository<Theme>
- [ ] PracticeRepository : GenericRepository<Practice>
- [ ] TimelineRepository : GenericRepository<TimelineEvent>

### Scenario 3: Custom query methods
- [ ] QuoteRepository.GetRandomQuoteAsync()
- [ ] QuoteRepository.GetQuotesByThemeAsync(themeId)
- [ ] PhilosopherRepository.GetByTraditionAsync(traditionId)
- [ ] TraditionRepository.GetWithPhilosophersAsync(id)

## Definition of Done
- [ ] All repositories implemented
- [ ] Unit tests for repository methods
- [ ] Dependency injection configured
- [ ] Located in Infrastructure/Repositories/

**Priority**: High | **Size**: L | **Phase**: 2-Data
"@

Write-Host "Created Repository Pattern issue" -ForegroundColor Green

# Seed Data Issues
Write-Host "`nCreating Seed Data issues..." -ForegroundColor Cyan

# Issue: Seed Traditions Data
& $gh issue create --repo $repo `
  --title "Create Database Seed Data (Traditions)" `
  --label "feature,blocked,data" `
  --body @"
# Issue: Create Database Seed Data (Traditions)

## User Story
As a developer
I want the Traditions table seeded with initial data
So that the database has the 7 philosophical traditions

## Dependencies
- **BLOCKED BY**: Database Migrations + Stoic Quotes + Vedanta Quotes issues

## Acceptance Criteria
### Scenario 1: All 7 traditions seeded
- [ ] Stoicism
- [ ] Cynicism
- [ ] Epicureanism
- [ ] Buddhism
- [ ] Vedanta
- [ ] Taoism
- [ ] Sufism

### Scenario 2: Each tradition includes
- [ ] Name, Description (200-300 words)
- [ ] Core principles (3-5)
- [ ] Historical period
- [ ] Geographic origin
- [ ] Key texts

## Definition of Done
- [ ] Seed data class in Infrastructure/Data/Seed/
- [ ] All 7 traditions inserted
- [ ] Idempotent seed logic (can run multiple times)
- [ ] Applied in DbContext.OnModelCreating or separate seeder

**Priority**: Medium | **Size**: M | **Phase**: 2-Data
"@

Write-Host "Created Seed Traditions Data issue" -ForegroundColor Green

# Issue: Seed Philosophers Data
& $gh issue create --repo $repo `
  --title "Create Database Seed Data (Philosophers)" `
  --label "feature,blocked,data" `
  --body @"
# Issue: Create Database Seed Data (Philosophers)

## User Story
As a developer
I want the Philosophers table seeded with biography data
So that the database has all 27+ philosopher biographies

## Dependencies
- **BLOCKED BY**: Database Migrations + Philosopher Biographies Content issue (#11)

## Acceptance Criteria
### Scenario 1: All 27+ philosophers seeded
- [ ] Data loaded from content/biographies/philosophers.json
- [ ] All fields populated correctly
- [ ] Associated with correct Traditions

### Scenario 2: Data integrity
- [ ] No orphaned records
- [ ] Birth/death years accurate
- [ ] Images linked correctly

## Definition of Done
- [ ] Seed data class created
- [ ] All philosophers from JSON inserted
- [ ] Foreign keys to Traditions correct
- [ ] Idempotent seed logic

**Priority**: Medium | **Size**: M | **Phase**: 2-Data
"@

Write-Host "Created Seed Philosophers Data issue" -ForegroundColor Green

# Issue: Seed Quotes Data
& $gh issue create --repo $repo `
  --title "Create Database Seed Data (Quotes)" `
  --label "feature,blocked,data" `
  --body @"
# Issue: Create Database Seed Data (Quotes)

## User Story
As a developer
I want the Quotes table seeded with all quote datasets
So that users can access 200+ wisdom quotes

## Dependencies
- **BLOCKED BY**: Database Migrations + All quote content issues (#9, #10, #17, #18-#22)

## Acceptance Criteria
### Scenario 1: All quotes seeded
- [ ] Load from all 7 JSON quote files
- [ ] 200+ total quotes inserted
- [ ] Associated with correct Philosophers and Traditions

### Scenario 2: Related data seeded
- [ ] Themes extracted and inserted
- [ ] Quote-Theme relationships (QuoteTheme join table)
- [ ] Difficulty levels assigned

## Definition of Done
- [ ] Seed data class created
- [ ] All 7 tradition quote sets loaded
- [ ] QuoteTheme many-to-many relationships created
- [ ] Idempotent seed logic

**Priority**: Medium | **Size**: L | **Phase**: 2-Data
"@

Write-Host "Created Seed Quotes Data issue" -ForegroundColor Green

# Issue: Seed Timeline Data
& $gh issue create --repo $repo `
  --title "Create Database Seed Data (Timeline Events)" `
  --label "feature,blocked,data" `
  --body @"
# Issue: Create Database Seed Data (Timeline Events)

## User Story
As a developer
I want the Timeline Events table seeded
So that users can browse philosophical history (45+ events)

## Dependencies
- **BLOCKED BY**: Database Migrations + Timeline Content issue (#12)

## Acceptance Criteria
### Scenario 1: All timeline events seeded
- [ ] Load from content/timeline/philosophical-timeline.json
- [ ] 45+ events inserted
- [ ] Chronological ordering

### Scenario 2: Event relationships
- [ ] Associated with Traditions
- [ ] Associated with Philosophers where applicable
- [ ] Event types assigned correctly

## Definition of Done
- [ ] Seed data class created
- [ ] All events loaded from JSON
- [ ] Relationships to Traditions/Philosophers correct
- [ ] Idempotent seed logic

**Priority**: Medium | **Size**: M | **Phase**: 2-Data
"@

Write-Host "Created Seed Timeline Data issue" -ForegroundColor Green

Write-Host "`n✅ Created Infrastructure and Seed Data issues successfully!" -ForegroundColor Green
Write-Host "Total issues created in this batch: 9" -ForegroundColor Yellow
