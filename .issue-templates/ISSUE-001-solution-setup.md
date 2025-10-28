# Issue #1: Setup .NET 8.0 Solution Structure with Clean Architecture

**Labels**: `feature`, `copilot-ready`, `size/M`, `phase-1`, `setup`

---

## User Story
As a developer
I want a properly structured .NET 8.0 solution following Clean Architecture
So that the codebase is maintainable, testable, and follows best practices

## Acceptance Criteria (BDD Scenarios)

### Scenario 1: Solution structure follows Clean Architecture
**Given** I am setting up a new .NET 8.0 solution
**When** I create the solution and project files
**Then** the solution should have the following projects:
- `AncientWisdom.Domain` (no external dependencies)
- `AncientWisdom.Application` (depends on Domain)
- `AncientWisdom.Infrastructure` (depends on Domain)
- `AncientWisdom.API` (depends on Application + Infrastructure)
**And** each project should target `.NET 8.0`
**And** all projects should compile successfully

### Scenario 2: Domain project has no external dependencies
**Given** the Domain project is created
**When** I inspect the Domain project file
**Then** it should have ZERO NuGet package dependencies
**And** it should only contain C# language features
**And** it should define core entities and interfaces

### Scenario 3: Test projects are configured correctly
**Given** the solution is created
**When** I add test projects
**Then** the solution should include:
- `AncientWisdom.UnitTests` (xUnit + FluentAssertions + Moq)
- `AncientWisdom.IntegrationTests` (xUnit + WebApplicationFactory)
- `AncientWisdom.BDD.Tests` (SpecFlow + xUnit)
**And** all test projects should reference appropriate application projects
**And** test projects should include necessary testing NuGet packages

### Scenario 4: Infrastructure project has EF Core configured
**Given** the Infrastructure project is created
**When** I add database dependencies
**Then** the project should include:
- `Microsoft.EntityFrameworkCore` (version 8.0.x)
- `Microsoft.EntityFrameworkCore.SqlServer` (version 8.0.x)
- `Microsoft.EntityFrameworkCore.Tools` (version 8.0.x)
**And** the project should have a placeholder `ApplicationDbContext.cs` class
**And** the DbContext should inherit from `DbContext`

### Scenario 5: API project is configured for ASP.NET Core Web API
**Given** the API project is created
**When** I configure the Web API project
**Then** the project should include:
- `Microsoft.AspNetCore.OpenApi` for Swagger
- `Swashbuckle.AspNetCore` for API documentation
- `Serilog.AspNetCore` for logging
**And** the `Program.cs` should configure Swagger/OpenAPI
**And** the project should have a Health Check endpoint configured

## Technical Implementation Hints

### Files to Create:
```
src/
├── AncientWisdom.sln
├── AncientWisdom.Domain/
│   ├── AncientWisdom.Domain.csproj
│   ├── Entities/ (folder - empty for now)
│   ├── Interfaces/ (folder - empty for now)
│   └── Enums/ (folder - empty for now)
├── AncientWisdom.Application/
│   ├── AncientWisdom.Application.csproj
│   ├── Services/ (folder - empty for now)
│   ├── Interfaces/ (folder - empty for now)
│   └── Mappings/ (folder - empty for now)
├── AncientWisdom.Infrastructure/
│   ├── AncientWisdom.Infrastructure.csproj
│   ├── Data/
│   │   └── ApplicationDbContext.cs
│   └── Repositories/ (folder - empty for now)
├── AncientWisdom.API/
│   ├── AncientWisdom.API.csproj
│   ├── Program.cs
│   ├── appsettings.json
│   └── appsettings.Development.json
tests/
├── AncientWisdom.UnitTests/
│   ├── AncientWisdom.UnitTests.csproj
│   └── README.md
├── AncientWisdom.IntegrationTests/
│   ├── AncientWisdom.IntegrationTests.csproj
│   └── README.md
└── AncientWisdom.BDD.Tests/
    ├── AncientWisdom.BDD.Tests.csproj
    ├── Features/ (folder - empty for now)
    └── StepDefinitions/ (folder - empty for now)
```

### NuGet Package Versions:
- **EF Core**: 8.0.10 or latest 8.0.x
- **xUnit**: 2.9.0 or latest
- **FluentAssertions**: 6.12.0 or latest
- **Moq**: 4.20.0 or latest
- **SpecFlow**: 3.9.0 or latest
- **Serilog**: 8.0.0 or latest

### ApplicationDbContext.cs Template:
```csharp
using Microsoft.EntityFrameworkCore;

namespace AncientWisdom.Infrastructure.Data;

public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }

    // DbSets will be added as entities are created

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
        
        // Configurations will be added here
    }
}
```

### Program.cs Template (Minimal API style):
```csharp
using Serilog;

var builder = WebApplication.CreateBuilder(args);

// Configure Serilog
Log.Logger = new LoggerConfiguration()
    .ReadFrom.Configuration(builder.Configuration)
    .CreateLogger();

builder.Host.UseSerilog();

// Add services
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddHealthChecks();

var app = builder.Build();

// Configure middleware
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

// Health check endpoint
app.MapHealthChecks("/api/health");

app.Run();
```

### Project Dependencies:
- **Domain**: NONE (pure C# only)
- **Application**: Domain
- **Infrastructure**: Domain, EF Core
- **API**: Application, Infrastructure (for DI registration only)

### Test Framework: 
- xUnit
- FluentAssertions for readable assertions
- Moq for mocking
- SpecFlow for BDD tests

### Build Verification:
After creating the solution, run:
```bash
dotnet restore
dotnet build --configuration Release
```

Both commands should succeed with zero errors.

## Definition of Done
- [ ] All 7 projects created with correct dependencies
- [ ] Solution file (`AncientWisdom.sln`) created and includes all projects
- [ ] All projects target .NET 8.0
- [ ] Domain project has zero external dependencies
- [ ] Infrastructure project has EF Core packages installed
- [ ] API project has Swagger and Serilog configured
- [ ] All test projects have appropriate testing packages
- [ ] `dotnet restore` completes successfully
- [ ] `dotnet build` completes successfully with zero errors
- [] Health check endpoint responds at `/api/health`
- [ ] Swagger UI accessible at `/swagger` in development mode
- [ ] Project structure matches ARCHITECTURE.md specification

## Out of Scope
- Entity definitions (will be added in subsequent issues)
- Database migrations (will be added after entities are defined)
- Actual API endpoints (beyond health check)
- Dependency injection configuration (beyond basics)
- Authentication/authorization
- Caching configuration

## References
- Architecture: [ARCHITECTURE.md](./ARCHITECTURE.md)
- Clean Architecture: https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html
- .NET 8.0 Docs: https://learn.microsoft.com/en-us/aspnet/core/

## Additional Notes
- Use **C# 12** language features
- Follow **Clean Architecture** principles strictly
- Ensure **zero warnings** on build
- Use **nullable reference types** enabled by default
- Follow **Microsoft coding conventions**
