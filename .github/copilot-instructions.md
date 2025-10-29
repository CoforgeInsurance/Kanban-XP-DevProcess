# Copilot Instructions for Ancient Wisdom API

## Project Overview
This is a **C# .NET 8.0 Clean Architecture** project building a RESTful API for ancient philosophical wisdom. The project uses **Agent-First Development** where GitHub Copilot SWE agents implement features defined in BDD-style issues.

## Architecture (Clean Architecture / Onion)

**4-Layer Structure** (dependency flow: API → Application → Domain ← Infrastructure):

```
AncientWisdom.API/          # Controllers, DTOs, Middleware, Program.cs
AncientWisdom.Application/  # Services, Mappings (AutoMapper), Validation
AncientWisdom.Domain/       # Entities, Interfaces, Enums (ZERO dependencies)
AncientWisdom.Infrastructure/ # EF Core DbContext, Repositories, Migrations
```

**Critical Rules**:
- Domain layer has NO external dependencies (not even EF Core)
- Infrastructure implements Domain interfaces
- API layer only references Application for services (Infrastructure registered in DI)

## Development Workflow (Agent-First TDD/BDD)

### 1. Issue Structure
Every feature issue contains:
- **User Story**: As a [role], I want [feature], so that [benefit]
- **BDD Scenarios**: Gherkin format (Given/When/Then) - these become automated tests
- **Technical Hints**: Files to create/modify, frameworks, patterns

### 2. Implementation Order (TDD Red-Green-Refactor)
1. **RED**: Write failing BDD tests from scenarios (SpecFlow + xUnit)
2. **RED**: Write failing unit tests (xUnit + FluentAssertions)
3. **GREEN**: Implement minimum code to pass tests
4. **REFACTOR**: Clean up while keeping tests green

### 3. File Naming Patterns
- **Entities**: `src/AncientWisdom.Domain/Entities/Quote.cs`
- **Services**: `src/AncientWisdom.Application/Services/QuoteService.cs` + `IQuoteService.cs` (interface)
- **Controllers**: `src/AncientWisdom.API/Controllers/QuotesController.cs`
- **Repositories**: `src/AncientWisdom.Infrastructure/Repositories/QuoteRepository.cs`
- **DTOs**: `src/AncientWisdom.Application/DTOs/QuoteDto.cs` (Application layer, NOT API)
- **EF Configs**: `src/AncientWisdom.Infrastructure/Data/Configurations/QuoteConfiguration.cs`
- **Unit Tests**: `tests/AncientWisdom.Tests/Services/QuoteServiceTests.cs`
- **BDD Tests**: `tests/AncientWisdom.BDD.Tests/Features/Quotes.feature` + `QuotesSteps.cs`

## Key Technologies & Patterns

### Testing Stack
- **xUnit** - All unit/integration tests
- **SpecFlow** - BDD scenarios (converts Gherkin to executable tests)
- **FluentAssertions** - Readable assertions (`result.Should().BeOfType<OkResult>()`)
- **Moq** - Mocking dependencies

### Data Access
- **EF Core 8.0** - Code-first with Fluent API configurations
- **Repository Pattern** - Abstract data access in Domain interfaces
- **PostgreSQL** - Local PostgreSQL for dev, Azure PostgreSQL for production
- **Npgsql.EntityFrameworkCore.PostgreSQL** - EF Core provider for PostgreSQL

### API Patterns
- **ASP.NET Core 8.0** - Minimal API or Controllers (check existing style)
- **AutoMapper** - Entity ↔ DTO mapping
- **FluentValidation** - Input validation
- **Swagger/OpenAPI** - Auto-generated docs

## Common Code Patterns

### Entity Configuration (EF Core Fluent API)
```csharp
// In Infrastructure/Data/Configurations/QuoteConfiguration.cs
public class QuoteConfiguration : IEntityTypeConfiguration<Quote>
{
    public void Configure(EntityTypeBuilder<Quote> builder)
    {
        builder.HasKey(q => q.Id);
        builder.Property(q => q.Text).IsRequired().HasMaxLength(2000);
        builder.HasOne(q => q.Philosopher)
               .WithMany(p => p.Quotes)
               .HasForeignKey(q => q.PhilosopherId);
    }
}
```

### Service Pattern
```csharp
// Interface in Application/Services/IQuoteService.cs
public interface IQuoteService
{
    Task<QuoteDto> GetByIdAsync(int id);
    Task<IEnumerable<QuoteDto>> GetAllAsync();
}

// Implementation in Application/Services/QuoteService.cs
public class QuoteService : IQuoteService
{
    private readonly IQuoteRepository _repository;
    private readonly IMapper _mapper;
    
    public QuoteService(IQuoteRepository repository, IMapper mapper)
    {
        _repository = repository;
        _mapper = mapper;
    }
    
    public async Task<QuoteDto> GetByIdAsync(int id)
    {
        var quote = await _repository.GetByIdAsync(id);
        return _mapper.Map<QuoteDto>(quote);
    }
}
```

### Controller Pattern (ASP.NET Core)
```csharp
[ApiController]
[Route("api/[controller]")]
public class QuotesController : ControllerBase
{
    private readonly IQuoteService _service;
    
    public QuotesController(IQuoteService service) => _service = service;
    
    [HttpGet("{id}")]
    public async Task<ActionResult<QuoteDto>> GetById(int id)
    {
        var result = await _service.GetByIdAsync(id);
        return result == null ? NotFound() : Ok(result);
    }
}
```

## Dependency Management (Auto-Assignment Workflow)

**IMPORTANT**: Issues are assigned to Copilot automatically based on dependency completion.

- When a PR merges, `.github/workflows/auto-assign-copilot.yml` checks dependency map
- If all blockers for an issue are complete, it auto-assigns to Copilot
- **Never assign issues manually** - let the workflow handle sequencing

**Typical Dependency Chain**:
```
Solution Structure (#7) 
  → Domain Entities (#17)
    → EF Configs (#20) 
      → Migrations (#21) 
        → Repositories (#22)
          → DTOs (#27) 
            → Services (#29-34, parallel)
              → API Controllers (#35-42, parallel)
```

Check `.issue-templates/ISSUE-DEPENDENCY-MAP.md` for full dependency graph.

## PR Requirements

**Every PR must include**:
- ✅ BDD scenarios implemented as SpecFlow tests (all passing)
- ✅ Unit tests with >80% coverage (all passing)
- ✅ Red-Green-Refactor cycle documented in commit history
- ✅ PR body contains "Fixes #[issue-number]" to trigger auto-assignment
- ✅ No warnings from `dotnet build`

**PR Template**: `.github/PULL_REQUEST_TEMPLATE.md` (auto-populated)

## Content Generation Tasks

Special category of issues for JSON data files (quotes, biographies, timelines):
- Located in `content/quotes/`, `content/bios/`, etc.
- No dependencies - can be assigned immediately
- Large files (40+ quotes) may timeout - check `.github/copilot.yml` for firewall config
- Structure defined in ARCHITECTURE.md (12 required fields per quote)

## Troubleshooting

**Firewall timeouts**: `.github/copilot.yml` configures network access for AI endpoints
**Build errors**: Check `ARCHITECTURE.md` for correct project references
**Test failures**: Ensure SpecFlow scenarios match Given/When/Then in issue
**Assignment issues**: Check `.github/workflows/auto-assign-copilot.yml` dependency map

## Key Documentation Files
- `AGENT_FIRST_PROCESS.md` - Complete agent development workflow
- `ARCHITECTURE.md` - System design, tech stack, project structure
- `ISSUE_MANAGEMENT_STRATEGY.md` - Dependency chains and auto-assignment
- `.github/WORKFLOWS.md` - All 9 automation workflows explained
