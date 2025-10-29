# Ancient Wisdom API - Architecture

## 🎯 Project Overview

**Ancient Wisdom API** is a RESTful web service providing curated wisdom from multiple ancient philosophical and spiritual traditions with modern context, scientific connections, and practical applications.

### Vision
Create a comprehensive, accessible repository of timeless wisdom that bridges ancient philosophy with modern science, psychology, and practical life applications.

### Tech Stack
- **Framework**: ASP.NET Core 8.0 Web API
- **Language**: C# 12
- **ORM**: Entity Framework Core 8.0
- **Database**: PostgreSQL (local PostgreSQL for dev, Azure Database for PostgreSQL for production)
- **EF Provider**: Npgsql.EntityFrameworkCore.PostgreSQL
- **Architecture**: Clean Architecture / Onion Architecture
- **Testing**: xUnit + SpecFlow (BDD) + FluentAssertions
- **Caching**: IMemoryCache (dev) / Redis (production)
- **Documentation**: Swagger/OpenAPI
- **Containerization**: Docker
- **CI/CD**: GitHub Actions → Azure Container Apps

---

## 🏗️ System Architecture

### Clean Architecture Layers

```
┌─────────────────────────────────────────────────────────┐
│                     Presentation Layer                   │
│              (AncientWisdom.API)                         │
│  • Controllers / Minimal API Endpoints                   │
│  • Middleware (CORS, Exception, Logging)                │
│  • DTOs (Request/Response models)                        │
│  • Swagger Configuration                                 │
└─────────────────────────────────────────────────────────┘
                          ↓ depends on
┌─────────────────────────────────────────────────────────┐
│                   Application Layer                      │
│            (AncientWisdom.Application)                   │
│  • Use Cases / Services                                  │
│  • DTOs / ViewModels                                     │
│  • Interfaces (for Infrastructure)                       │
│  • Mapping Profiles (AutoMapper)                         │
│  • Validation (FluentValidation)                         │
│  • Business Logic                                        │
└─────────────────────────────────────────────────────────┘
                          ↓ depends on
┌─────────────────────────────────────────────────────────┐
│                     Domain Layer                         │
│              (AncientWisdom.Domain)                      │
│  • Entities (Tradition, Philosopher, Quote, etc.)       │
│  • Value Objects                                         │
│  • Domain Events                                         │
│  • Interfaces (IRepository)                              │
│  • Enums (DifficultyLevel, etc.)                        │
│  • Domain Logic                                          │
└─────────────────────────────────────────────────────────┘
                          ↑ implements
┌─────────────────────────────────────────────────────────┐
│                  Infrastructure Layer                    │
│           (AncientWisdom.Infrastructure)                 │
│  • EF Core DbContext                                     │
│  • Repository Implementations                            │
│  • Database Migrations                                   │
│  • External Services (future: AI, caching)              │
│  • Configuration                                         │
└─────────────────────────────────────────────────────────┘
```

**Key Principles**:
- Domain layer has **zero dependencies**
- Infrastructure depends on Domain (via interfaces)
- Application depends on Domain
- API depends on Application + Infrastructure (for DI only)
- Dependency Inversion Principle enforced

---

## 📦 Project Structure

```
Kanban-XP-DevProcess/
├── .github/                          # GitHub automation (existing)
├── docs/                             # Process documentation (existing)
├── src/                              # NEW - Source code
│   ├── AncientWisdom.API/
│   │   ├── Controllers/
│   │   │   ├── TraditionsController.cs
│   │   │   ├── PhilosophersController.cs
│   │   │   ├── QuotesController.cs
│   │   │   ├── ThemesController.cs
│   │   │   └── PracticesController.cs
│   │   ├── Middleware/
│   │   │   ├── ExceptionHandlingMiddleware.cs
│   │   │   └── RequestLoggingMiddleware.cs
│   │   ├── DTOs/
│   │   │   ├── QuoteDto.cs
│   │   │   ├── PhilosopherDto.cs
│   │   │   └── TraditionDto.cs
│   │   ├── Program.cs
│   │   ├── appsettings.json
│   │   └── AncientWisdom.API.csproj
│   │
│   ├── AncientWisdom.Application/
│   │   ├── Services/
│   │   │   ├── IQuoteService.cs
│   │   │   ├── QuoteService.cs
│   │   │   ├── IPhilosopherService.cs
│   │   │   └── PhilosopherService.cs
│   │   ├── Interfaces/
│   │   │   └── IApplicationDbContext.cs
│   │   ├── Mappings/
│   │   │   └── MappingProfile.cs
│   │   ├── Validators/
│   │   │   └── QuoteValidator.cs
│   │   └── AncientWisdom.Application.csproj
│   │
│   ├── AncientWisdom.Domain/
│   │   ├── Entities/
│   │   │   ├── Tradition.cs
│   │   │   ├── Philosopher.cs
│   │   │   ├── Quote.cs
│   │   │   ├── Theme.cs
│   │   │   ├── ThemePerspective.cs
│   │   │   ├── Practice.cs
│   │   │   └── TimelineEvent.cs
│   │   ├── Enums/
│   │   │   ├── DifficultyLevel.cs
│   │   │   └── PracticeFrequency.cs
│   │   ├── Interfaces/
│   │   │   ├── IRepository.cs
│   │   │   ├── IQuoteRepository.cs
│   │   │   └── IPhilosopherRepository.cs
│   │   └── AncientWisdom.Domain.csproj
│   │
│   ├── AncientWisdom.Infrastructure/
│   │   ├── Data/
│   │   │   ├── ApplicationDbContext.cs
│   │   │   ├── Configurations/
│   │   │   │   ├── QuoteConfiguration.cs
│   │   │   │   └── PhilosopherConfiguration.cs
│   │   │   └── Migrations/
│   │   ├── Repositories/
│   │   │   ├── Repository.cs
│   │   │   ├── QuoteRepository.cs
│   │   │   └── PhilosopherRepository.cs
│   │   ├── Seed/
│   │   │   ├── SeedData.cs
│   │   │   └── seed-data.json
│   │   └── AncientWisdom.Infrastructure.csproj
│   │
│   ├── AncientWisdom.Shared/
│   │   ├── Constants/
│   │   └── Extensions/
│   │
│   └── AncientWisdom.sln
│
├── tests/                            # NEW - Test projects
│   ├── AncientWisdom.UnitTests/
│   │   ├── Domain/
│   │   ├── Application/
│   │   └── AncientWisdom.UnitTests.csproj
│   ├── AncientWisdom.IntegrationTests/
│   │   ├── API/
│   │   ├── Infrastructure/
│   │   └── AncientWisdom.IntegrationTests.csproj
│   └── AncientWisdom.BDD.Tests/
│       ├── Features/
│       │   ├── Quotes.feature
│       │   └── Philosophers.feature
│       ├── StepDefinitions/
│       └── AncientWisdom.BDD.Tests.csproj
│
├── ARCHITECTURE.md                   # This file
├── API_SPECIFICATION.md              # API contract
├── Dockerfile
├── docker-compose.yml
└── .dockerignore
```

---

## 📊 Domain Model

### Core Entities

#### **Tradition**
Represents a philosophical or spiritual tradition.

```csharp
public class Tradition
{
    public int Id { get; set; }
    public string Name { get; set; }              // "Stoicism"
    public string Origin { get; set; }            // "Ancient Greece"
    public int FoundedYear { get; set; }          // -300
    public string GeographicalRegion { get; set; }
    public string CorePrinciples { get; set; }    // JSON array
    public string HistoricalContext { get; set; }
    public string ModernRelevance { get; set; }
    public string ScientificConnections { get; set; }
    
    // Navigation properties
    public ICollection<Philosopher> Philosophers { get; set; }
    public ICollection<Quote> Quotes { get; set; }
    public ICollection<Practice> Practices { get; set; }
    public ICollection<ThemePerspective> ThemePerspectives { get; set; }
}
```

#### **Philosopher**
Represents a historical teacher/philosopher.

```csharp
public class Philosopher
{
    public int Id { get; set; }
    public string Name { get; set; }
    public int TraditionId { get; set; }
    public int? BirthYear { get; set; }
    public int? DeathYear { get; set; }
    public string Era { get; set; }               // "Hellenistic Period"
    public string Biography { get; set; }
    public string MajorWorks { get; set; }
    public string KeyTeachings { get; set; }
    public string Legacy { get; set; }
    public string ImageUrl { get; set; }
    
    // Navigation properties
    public Tradition Tradition { get; set; }
    public ICollection<Quote> Quotes { get; set; }
}
```

#### **Quote**
Represents a wisdom quote with context.

```csharp
public class Quote
{
    public int Id { get; set; }
    public int PhilosopherId { get; set; }
    public int TraditionId { get; set; }
    public string Text { get; set; }
    public string Source { get; set; }            // "Meditations, Book 5"
    public string Context { get; set; }
    public string ModernInterpretation { get; set; }
    public string PracticalApplication { get; set; }
    public string PsychologyConnection { get; set; }
    
    // Navigation properties
    public Philosopher Philosopher { get; set; }
    public Tradition Tradition { get; set; }
    public ICollection<QuoteTheme> QuoteThemes { get; set; } // Many-to-many
}
```

#### **Theme**
Universal themes across traditions.

```csharp
public class Theme
{
    public int Id { get; set; }
    public string Name { get; set; }              // "Impermanence"
    public string Description { get; set; }
    public string ModernApplication { get; set; }
    
    // Navigation properties
    public ICollection<ThemePerspective> Perspectives { get; set; }
    public ICollection<QuoteTheme> QuoteThemes { get; set; }
}
```

#### **ThemePerspective**
How each tradition approaches a universal theme.

```csharp
public class ThemePerspective
{
    public int Id { get; set; }
    public int ThemeId { get; set; }
    public int TraditionId { get; set; }
    public string Approach { get; set; }          // How this tradition teaches it
    public string KeyConcept { get; set; }        // e.g., "Anicca" for Buddhism
    public string RelatedPractices { get; set; }
    
    // Navigation properties
    public Theme Theme { get; set; }
    public Tradition Tradition { get; set; }
}
```

#### **Practice**
Actionable exercises from each tradition.

```csharp
public class Practice
{
    public int Id { get; set; }
    public string Name { get; set; }
    public int TraditionId { get; set; }
    public DifficultyLevel Difficulty { get; set; }
    public string Instructions { get; set; }      // Step-by-step
    public int DurationMinutes { get; set; }
    public PracticeFrequency Frequency { get; set; }
    public string Benefits { get; set; }
    public string ScientificEvidence { get; set; }
    public string CommonPitfalls { get; set; }
    
    // Navigation properties
    public Tradition Tradition { get; set; }
}
```

---

## 🔌 API Design

### RESTful Endpoints

```http
# Traditions
GET    /api/traditions
GET    /api/traditions/{id}
GET    /api/traditions/{id}/philosophers
GET    /api/traditions/{id}/quotes

# Philosophers
GET    /api/philosophers
GET    /api/philosophers/{id}
GET    /api/philosophers/{id}/quotes

# Quotes
GET    /api/quotes
GET    /api/quotes/{id}
GET    /api/quotes/random
GET    /api/quotes/daily
GET    /api/quotes/search?q={query}

# Themes
GET    /api/themes
GET    /api/themes/{id}
GET    /api/themes/{id}/perspectives

# Practices
GET    /api/practices
GET    /api/practices/{id}

# Timeline
GET    /api/timeline

# Comparisons (Phase 2)
GET    /api/compare?topic={topic}

# Health
GET    /api/health
```

### Response Format

**Success Response**:
```json
{
  "success": true,
  "data": { ... },
  "message": null
}
```

**Error Response**:
```json
{
  "success": false,
  "data": null,
  "message": "Error description",
  "errors": ["Validation error 1", "Validation error 2"]
}
```

---

## 📚 Content Strategy

### Philosophical Traditions (7)

1. **Stoicism** (Greece/Rome, -300 to 200 CE)
   - Philosophers: Marcus Aurelius, Seneca, Epictetus, Musonius Rufus
   
2. **Cynicism** (Greece, -400 to 200 CE)
   - Philosophers: Diogenes of Sinope, Antisthenes, Crates of Thebes

3. **Epicureanism** (Greece, -300 to 200 CE)
   - Philosophers: Epicurus, Lucretius, Metrodorus

4. **Buddhism** (India/Asia, -500 BCE to present)
   - Teachers: Gautama Buddha, Nagarjuna, Bodhidharma, Dogen

5. **Vedanta** (India, -800 to present)
   - Teachers: Adi Shankara, Ramana Maharshi, Ramanuja, Madhvacharya

6. **Taoism** (China, -400 to present)
   - Teachers: Laozi, Zhuangzi, Liezi

7. **Sufism** (Persia/Middle East, 800 to present)
   - Teachers: Rumi, Hafiz, Ibn Arabi, Al-Ghazali, Jiddu Krishnamurti

### Content Volume (Phase 1 Target)

- **Traditions**: 7
- **Philosophers**: 30-35 (4-5 per tradition)
- **Quotes**: 200-250 (30-35 per tradition)
- **Themes**: 10-12 universal themes
- **Practices**: 30-40 (4-6 per tradition)
- **Timeline Events**: 50-70

---

## 🧪 Testing Strategy

### Test Pyramid

```
              ┌─────────────┐
              │     E2E     │  SpecFlow BDD (5-10%)
              │   (BDD)     │
              └─────────────┘
            ┌───────────────────┐
            │   Integration     │  API + Database (20-30%)
            │     Tests         │
            └───────────────────┘
          ┌─────────────────────────┐
          │      Unit Tests         │  Domain + Application (60-70%)
          │   (TDD - Red/Green)     │
          └─────────────────────────┘
```

### Testing Frameworks

- **Unit Tests**: xUnit + FluentAssertions + Moq
- **Integration Tests**: xUnit + WebApplicationFactory + Test Containers
- **BDD Tests**: SpecFlow + xUnit
- **Coverage Target**: >80%

### BDD Example

```gherkin
Feature: Get quotes from specific tradition
  As a user seeking wisdom
  I want to browse quotes from a specific philosophical tradition
  So that I can learn from that school of thought

  Scenario: Get all Stoic quotes
    Given the database contains 30 Stoic quotes
    When I request GET /api/quotes?tradition=Stoicism
    Then the response status should be 200
    And the response should contain 30 quotes
    And all quotes should have tradition "Stoicism"
    And each quote should include modern interpretation
```

---

## 🚀 Deployment Architecture

### Local Development
```
Developer Machine (Windows/Mac/Linux)
├── Visual Studio 2022 or VS Code
├── PostgreSQL (local instance or Docker container)
├── .NET 8.0 SDK
└── Docker Desktop (optional for containerized PostgreSQL)
```

### Production (Azure)
```
Azure Cloud
├── Azure Container Apps (API host)
├── Azure Database for PostgreSQL (data storage)
├── Azure Cache for Redis (distributed caching)
├── Azure Application Insights (monitoring)
└── Azure Container Registry (Docker images)
```

### CI/CD Pipeline
```
GitHub Actions Workflow:
1. Code pushed to branch
2. Restore dependencies
3. Build solution
4. Run unit tests (TDD)
5. Run integration tests
6. Run BDD tests (SpecFlow)
7. Build Docker image
8. Push to Azure Container Registry
9. Deploy to Azure Container Apps
```

---

## 🔒 Security Considerations

### Phase 1 (Public Read-Only API)
- No authentication required
- CORS configured for public access
- Rate limiting (future)
- Input validation on all endpoints

### Phase 2 (Future - Admin Features)
- JWT authentication for admin endpoints
- Role-based authorization
- Audit logging
- API key management

---

## ⚡ Performance Targets

- **API Response Time**: <100ms (p95)
- **Database Query Time**: <50ms (p95)
- **Cache Hit Ratio**: >80%
- **Concurrent Users**: 1000+ (horizontal scaling)
- **Test Coverage**: >80%

---

## 📈 Scalability

### Horizontal Scaling
- Stateless API design
- Multiple container instances in Azure Container Apps
- Load balancing automatic

### Database Scaling
- Read replicas for query-heavy workloads
- Caching layer (Redis) for frequently accessed data
- Indexed queries on common filters

### Caching Strategy
- Memory cache for reference data (traditions, themes)
- Distributed cache (Redis) for quote of the day
- Cache invalidation on data updates

---

## 🛠️ Development Workflow

### Phase-Based Development

**Phase 1: MVP (Weeks 1-3)**
1. Project structure setup
2. Domain entities + EF Core
3. Basic CRUD for Traditions, Philosophers, Quotes
4. Seed data (50 quotes, 7 traditions, 20 philosophers)
5. Unit tests + Integration tests

**Phase 2: Enhanced Features (Weeks 4-5)**
6. Themes + cross-tradition perspectives
7. Practices with instructions
8. Timeline
9. Search functionality
10. BDD tests (SpecFlow)

**Phase 3: Production Ready (Week 6)**
11. Caching layer
12. Swagger documentation enhancements
13. Docker containerization
14. Azure deployment
15. Performance optimization

---

## 📖 Related Documentation

- [API Specification](./API_SPECIFICATION.md) - Detailed API contract
- [AGENT_FIRST_PROCESS.md](./docs/AGENT_FIRST_PROCESS.md) - Development workflow
- [DEVELOPMENT_PROCESS.md](./docs/DEVELOPMENT_PROCESS.md) - Kanban+XP+Lean methodology

---

_Last Updated: October 28, 2025_
