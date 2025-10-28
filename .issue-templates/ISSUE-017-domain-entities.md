# Issue: Define Domain Entities for Ancient Wisdom API

## User Story

As a developer
I want complete domain entity definitions following Clean Architecture
So that the application has a solid foundational data model

## Dependencies
- **BLOCKED BY**: #7 (Setup .NET 8.0 Solution Structure)
- **DO NOT ASSIGN** until #7 is merged

## Acceptance Criteria (BDD Scenarios)

### Scenario 1: All 7 core entities defined

```gherkin
Given the Domain project exists
When I create entity classes
Then the Domain should include:
  - Tradition entity
  - Philosopher entity
  - Quote entity
  - Theme entity
  - ThemePerspective entity
  - Practice entity
  - TimelineEvent entity
And each entity should be in Domain/Entities/ folder
And all entities should have proper navigation properties
```

### Scenario 2: Entities follow DDD patterns

```gherkin
Given I am creating domain entities
When I define entity structure
Then each entity should:
  - Have an Id property (int primary key)
  - Include all required properties from ARCHITECTURE.md
  - Use proper C# data types
  - Include XML documentation comments
  - Follow nullable reference type conventions
And entities should NOT reference EF Core or any external packages
And entities should be pure C# classes
```

### Scenario 3: Navigation properties support relationships

```gherkin
Given entities have relationships
When I define navigation properties
Then relationships should include:
  - Tradition has many Philosophers (one-to-many)
  - Tradition has many Quotes (one-to-many)
  - Philosopher has many Quotes (one-to-many)
  - Quote belongs to Philosopher and Tradition (many-to-one)
  - Theme has many ThemePerspectives (one-to-many)
  - Quote has many Themes (many-to-many via QuoteTheme join)
And all navigation properties should use ICollection<T>
And foreign key properties should be defined
```

### Scenario 4: Enums are defined for constrained values

```gherkin
Given some properties have limited value sets
When I create enum types
Then the Domain should include:
  - DifficultyLevel enum (Beginner, Intermediate, Advanced)
  - PracticeFrequency enum (Daily, Weekly, Monthly, AsNeeded)
  - EventType enum (Birth, Death, WorkPublished, TeachingEvent, HistoricalMilestone)
And enums should be in Domain/Enums/ folder
And enums should have XML documentation
```

## Technical Implementation Hints

### Files to Create

```
src/AncientWisdom.Domain/
├── Entities/
│   ├── Tradition.cs
│   ├── Philosopher.cs
│   ├── Quote.cs
│   ├── Theme.cs
│   ├── ThemePerspective.cs
│   ├── Practice.cs
│   ├── TimelineEvent.cs
│   └── QuoteTheme.cs (many-to-many join)
└── Enums/
    ├── DifficultyLevel.cs
    ├── PracticeFrequency.cs
    └── EventType.cs
```

### Entity Templates (Based on ARCHITECTURE.md)

#### **Tradition.cs**

```csharp
namespace AncientWisdom.Domain.Entities;

/// <summary>
/// Represents a philosophical tradition (e.g., Stoicism, Buddhism, Vedanta).
/// </summary>
public class Tradition
{
    /// <summary>
    /// Gets or sets the unique identifier.
    /// </summary>
    public int Id { get; set; }

    /// <summary>
    /// Gets or sets the name of the tradition (e.g., "Stoicism").
    /// </summary>
    public string Name { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets the geographical origin (e.g., "Ancient Greece").
    /// </summary>
    public string Origin { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets the time period (e.g., "4th century BCE - present").
    /// </summary>
    public string TimePeriod { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets a comprehensive description of the tradition.
    /// </summary>
    public string Description { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets the core philosophical principles.
    /// </summary>
    public string CorePrinciples { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets the historical context of emergence.
    /// </summary>
    public string HistoricalContext { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets modern relevance and applications.
    /// </summary>
    public string ModernRelevance { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets connections to scientific research.
    /// </summary>
    public string? ScientificConnections { get; set; }

    // Navigation properties

    /// <summary>
    /// Gets or sets the philosophers associated with this tradition.
    /// </summary>
    public ICollection<Philosopher> Philosophers { get; set; } = new List<Philosopher>();

    /// <summary>
    /// Gets or sets the quotes from this tradition.
    /// </summary>
    public ICollection<Quote> Quotes { get; set; } = new List<Quote>();

    /// <summary>
    /// Gets or sets the practices from this tradition.
    /// </summary>
    public ICollection<Practice> Practices { get; set; } = new List<Practice>();

    /// <summary>
    /// Gets or sets the theme perspectives from this tradition.
    /// </summary>
    public ICollection<ThemePerspective> ThemePerspectives { get; set; } = new List<ThemePerspective>();
}
```

#### **Philosopher.cs**

```csharp
namespace AncientWisdom.Domain.Entities;

/// <summary>
/// Represents a historical philosopher or teacher.
/// </summary>
public class Philosopher
{
    /// <summary>
    /// Gets or sets the unique identifier.
    /// </summary>
    public int Id { get; set; }

    /// <summary>
    /// Gets or sets the philosopher's full name.
    /// </summary>
    public string Name { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets the foreign key to the tradition.
    /// </summary>
    public int TraditionId { get; set; }

    /// <summary>
    /// Gets or sets the birth year (nullable if unknown).
    /// </summary>
    public int? BirthYear { get; set; }

    /// <summary>
    /// Gets or sets the death year (nullable if still living or unknown).
    /// </summary>
    public int? DeathYear { get; set; }

    /// <summary>
    /// Gets or sets the historical era (e.g., "Hellenistic Period").
    /// </summary>
    public string Era { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets the biography (life story).
    /// </summary>
    public string Biography { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets major works or teachings.
    /// </summary>
    public string MajorWorks { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets key teachings or philosophical contributions.
    /// </summary>
    public string KeyTeachings { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets the philosopher's legacy and influence.
    /// </summary>
    public string Legacy { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets the URL to the philosopher's image.
    /// </summary>
    public string? ImageUrl { get; set; }

    // Navigation properties

    /// <summary>
    /// Gets or sets the tradition this philosopher belongs to.
    /// </summary>
    public Tradition Tradition { get; set; } = null!;

    /// <summary>
    /// Gets or sets the quotes attributed to this philosopher.
    /// </summary>
    public ICollection<Quote> Quotes { get; set; } = new List<Quote>();
}
```

#### **Quote.cs**

```csharp
namespace AncientWisdom.Domain.Entities;

/// <summary>
/// Represents a wisdom quote with modern context.
/// </summary>
public class Quote
{
    /// <summary>
    /// Gets or sets the unique identifier.
    /// </summary>
    public int Id { get; set; }

    /// <summary>
    /// Gets or sets the foreign key to the philosopher.
    /// </summary>
    public int PhilosopherId { get; set; }

    /// <summary>
    /// Gets or sets the foreign key to the tradition.
    /// </summary>
    public int TraditionId { get; set; }

    /// <summary>
    /// Gets or sets the quote text.
    /// </summary>
    public string Text { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets the source (book, section, etc.).
    /// </summary>
    public string Source { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets the historical context of the quote.
    /// </summary>
    public string Context { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets the modern interpretation.
    /// </summary>
    public string ModernInterpretation { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets practical application guidance.
    /// </summary>
    public string PracticalApplication { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets connections to modern psychology.
    /// </summary>
    public string? PsychologyConnection { get; set; }

    // Navigation properties

    /// <summary>
    /// Gets or sets the philosopher who said this quote.
    /// </summary>
    public Philosopher Philosopher { get; set; } = null!;

    /// <summary>
    /// Gets or sets the tradition this quote belongs to.
    /// </summary>
    public Tradition Tradition { get; set; } = null!;

    /// <summary>
    /// Gets or sets the quote-theme relationships (many-to-many).
    /// </summary>
    public ICollection<QuoteTheme> QuoteThemes { get; set; } = new List<QuoteTheme>();
}
```

#### **Theme.cs**

```csharp
namespace AncientWisdom.Domain.Entities;

/// <summary>
/// Represents a universal philosophical theme (e.g., "Impermanence").
/// </summary>
public class Theme
{
    /// <summary>
    /// Gets or sets the unique identifier.
    /// </summary>
    public int Id { get; set; }

    /// <summary>
    /// Gets or sets the theme name.
    /// </summary>
    public string Name { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets the theme description.
    /// </summary>
    public string Description { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets modern applications of the theme.
    /// </summary>
    public string ModernApplication { get; set; } = string.Empty;

    // Navigation properties

    /// <summary>
    /// Gets or sets the perspectives from different traditions.
    /// </summary>
    public ICollection<ThemePerspective> Perspectives { get; set; } = new List<ThemePerspective>();

    /// <summary>
    /// Gets or sets the quote-theme relationships.
    /// </summary>
    public ICollection<QuoteTheme> QuoteThemes { get; set; } = new List<QuoteTheme>();
}
```

#### **ThemePerspective.cs**

```csharp
namespace AncientWisdom.Domain.Entities;

/// <summary>
/// Represents how a specific tradition approaches a universal theme.
/// </summary>
public class ThemePerspective
{
    /// <summary>
    /// Gets or sets the unique identifier.
    /// </summary>
    public int Id { get; set; }

    /// <summary>
    /// Gets or sets the foreign key to the theme.
    /// </summary>
    public int ThemeId { get; set; }

    /// <summary>
    /// Gets or sets the foreign key to the tradition.
    /// </summary>
    public int TraditionId { get; set; }

    /// <summary>
    /// Gets or sets how this tradition approaches the theme.
    /// </summary>
    public string Approach { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets the key concept from this tradition (e.g., "Anicca" for Buddhism).
    /// </summary>
    public string KeyConcept { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets related practices from this tradition.
    /// </summary>
    public string? RelatedPractices { get; set; }

    // Navigation properties

    /// <summary>
    /// Gets or sets the theme being addressed.
    /// </summary>
    public Theme Theme { get; set; } = null!;

    /// <summary>
    /// Gets or sets the tradition providing this perspective.
    /// </summary>
    public Tradition Tradition { get; set; } = null!;
}
```

#### **Practice.cs**

```csharp
using AncientWisdom.Domain.Enums;

namespace AncientWisdom.Domain.Entities;

/// <summary>
/// Represents an actionable philosophical practice or exercise.
/// </summary>
public class Practice
{
    /// <summary>
    /// Gets or sets the unique identifier.
    /// </summary>
    public int Id { get; set; }

    /// <summary>
    /// Gets or sets the practice name.
    /// </summary>
    public string Name { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets the foreign key to the tradition.
    /// </summary>
    public int TraditionId { get; set; }

    /// <summary>
    /// Gets or sets the difficulty level.
    /// </summary>
    public DifficultyLevel Difficulty { get; set; }

    /// <summary>
    /// Gets or sets step-by-step instructions.
    /// </summary>
    public string Instructions { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets the recommended duration in minutes.
    /// </summary>
    public int DurationMinutes { get; set; }

    /// <summary>
    /// Gets or sets the recommended practice frequency.
    /// </summary>
    public PracticeFrequency Frequency { get; set; }

    /// <summary>
    /// Gets or sets the benefits of this practice.
    /// </summary>
    public string Benefits { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets scientific evidence supporting the practice.
    /// </summary>
    public string? ScientificEvidence { get; set; }

    /// <summary>
    /// Gets or sets common pitfalls to avoid.
    /// </summary>
    public string? CommonPitfalls { get; set; }

    // Navigation properties

    /// <summary>
    /// Gets or sets the tradition this practice belongs to.
    /// </summary>
    public Tradition Tradition { get; set; } = null!;
}
```

#### **TimelineEvent.cs**

```csharp
using AncientWisdom.Domain.Enums;

namespace AncientWisdom.Domain.Entities;

/// <summary>
/// Represents a significant event in philosophical history.
/// </summary>
public class TimelineEvent
{
    /// <summary>
    /// Gets or sets the unique identifier.
    /// </summary>
    public int Id { get; set; }

    /// <summary>
    /// Gets or sets the year of the event (negative for BCE).
    /// </summary>
    public int Year { get; set; }

    /// <summary>
    /// Gets or sets the event title.
    /// </summary>
    public string Title { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets a detailed description of the event.
    /// </summary>
    public string Description { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets the traditions affected by this event.
    /// </summary>
    public string Traditions { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets the event type category.
    /// </summary>
    public EventType EventType { get; set; }

    /// <summary>
    /// Gets or sets the significance of this event.
    /// </summary>
    public string Significance { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets related philosopher names (comma-separated).
    /// </summary>
    public string? RelatedPhilosophers { get; set; }

    /// <summary>
    /// Gets or sets related works or texts (comma-separated).
    /// </summary>
    public string? RelatedWorks { get; set; }

    /// <summary>
    /// Gets or sets the geographic location.
    /// </summary>
    public string GeographicLocation { get; set; } = string.Empty;

    /// <summary>
    /// Gets or sets a modern parallel or equivalent event.
    /// </summary>
    public string? ModernParallel { get; set; }
}
```

#### **QuoteTheme.cs** (Join Table)

```csharp
namespace AncientWisdom.Domain.Entities;

/// <summary>
/// Join entity for the many-to-many relationship between Quotes and Themes.
/// </summary>
public class QuoteTheme
{
    /// <summary>
    /// Gets or sets the foreign key to the quote.
    /// </summary>
    public int QuoteId { get; set; }

    /// <summary>
    /// Gets or sets the foreign key to the theme.
    /// </summary>
    public int ThemeId { get; set; }

    // Navigation properties

    /// <summary>
    /// Gets or sets the quote.
    /// </summary>
    public Quote Quote { get; set; } = null!;

    /// <summary>
    /// Gets or sets the theme.
    /// </summary>
    public Theme Theme { get; set; } = null!;
}
```

### Enum Definitions

#### **DifficultyLevel.cs**

```csharp
namespace AncientWisdom.Domain.Enums;

/// <summary>
/// Represents the difficulty level of a practice or quote.
/// </summary>
public enum DifficultyLevel
{
    /// <summary>
    /// Beginner level - accessible to all.
    /// </summary>
    Beginner = 0,

    /// <summary>
    /// Intermediate level - requires some background.
    /// </summary>
    Intermediate = 1,

    /// <summary>
    /// Advanced level - requires significant philosophical understanding.
    /// </summary>
    Advanced = 2
}
```

#### **PracticeFrequency.cs**

```csharp
namespace AncientWisdom.Domain.Enums;

/// <summary>
/// Represents how often a practice should be performed.
/// </summary>
public enum PracticeFrequency
{
    /// <summary>
    /// Practice daily.
    /// </summary>
    Daily = 0,

    /// <summary>
    /// Practice weekly.
    /// </summary>
    Weekly = 1,

    /// <summary>
    /// Practice monthly.
    /// </summary>
    Monthly = 2,

    /// <summary>
    /// Practice as needed or situational.
    /// </summary>
    AsNeeded = 3
}
```

#### **EventType.cs**

```csharp
namespace AncientWisdom.Domain.Enums;

/// <summary>
/// Represents the type of timeline event.
/// </summary>
public enum EventType
{
    /// <summary>
    /// Birth of a philosopher.
    /// </summary>
    Birth = 0,

    /// <summary>
    /// Death of a philosopher.
    /// </summary>
    Death = 1,

    /// <summary>
    /// Publication or creation of a significant work.
    /// </summary>
    WorkPublished = 2,

    /// <summary>
    /// A significant teaching event (e.g., first sermon).
    /// </summary>
    TeachingEvent = 3,

    /// <summary>
    /// A historical milestone related to philosophy.
    /// </summary>
    HistoricalMilestone = 4
}
```

## Definition of Done

- [ ] All 8 entity classes created in Domain/Entities/
- [ ] All 3 enum types created in Domain/Enums/
- [ ] Each entity has XML documentation on class and all properties
- [ ] Navigation properties properly defined with ICollection<T>
- [ ] Foreign key properties included for relationships
- [ ] Zero external package dependencies (pure C# only)
- [ ] Nullable reference types used correctly
- [ ] Code compiles with zero warnings
- [ ] Entity structure matches ARCHITECTURE.md specification
- [ ] All properties have appropriate data types (string, int, int?, etc.)

## Out of Scope
- EF Core configurations (Issue #20)
- Data annotations (will use Fluent API in Infrastructure)
- Validation logic (will be in Application layer)
- Database migrations (Issue #21)

## References
- [ARCHITECTURE.md](./ARCHITECTURE.md) - See "Domain Entities" section

---

**Labels:** `domain`, `copilot-ready`, `blocked-by-#7`
**Assignee:** DO NOT ASSIGN until #7 is merged
