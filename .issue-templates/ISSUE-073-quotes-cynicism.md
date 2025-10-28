# Issue: Create Cynicism Philosophy Quotes Dataset

## User Story

As a content creator
I want a comprehensive collection of Cynicism philosophy quotes
So that users can access authentic wisdom with modern context and practical applications

## Dependencies
- None (parallel-safe content generation)

## Acceptance Criteria (BDD Scenarios)

### Scenario 1: Quote structure includes all required fields

```gherkin
Given I am creating quotes from Cynic philosophers
When I structure each quote
Then each quote should include all 12 required fields:
  - PhilosopherName, Text, ShortVersion, Source, Context
  - ModernInterpretation, PracticalApplication, PsychologyConnection
  - RelatedThemes, DifficultyLevel, ReflectionPrompt, ModernExamples
```

### Scenario 2: Coverage across major Cynic philosophers

```gherkin
Given I am creating a Cynicism quotes collection
When I select philosophers
Then the collection should include quotes from:
  - Diogenes of Sinope (Founder's student, 412-323 BCE) - 25 quotes minimum
  - Crates of Thebes (Diogenes's student, 365-285 BCE) - 8 quotes minimum
  - Antisthenes (Proto-Cynic, 445-365 BCE) - 7 quotes minimum
And each philosopher should represent their unique Cynic perspective
```

### Scenario 3: Thematic diversity and balance

```gherkin
Given I am curating Cynic quotes
When I organize by themes
Then the collection should cover:
  | Theme                    | Min Quotes | Key Concepts                              |
  |--------------------------|------------|-------------------------------------------|
  | Radical Simplicity       | 8          | Material detachment, living in barrel     |
  | Shamelessness (Anaideia) | 7          | Rejecting social conventions              |
  | Self-Sufficiency         | 7          | Autarkeia, freedom from needs             |
  | Virtue in Action         | 6          | Arete through practice, not theory        |
  | Critique of Society      | 6          | Exposing hypocrisy, cultural norms        |
  | Freedom & Independence   | 5          | Eleutheria, rejecting authority           |
  | Living Like a Dog        | 3          | Cynicism etymology, natural life          |
And total should be 42+ quotes
```

## Data Format (JSON Schema)

```json
{
  "tradition": "Cynicism",
  "quotes": [
    {
      "id": 1,
      "philosopher": {
        "name": "Diogenes of Sinope",
        "era": "Ancient Greece (412-323 BCE)",
        "role": "Cynic Philosopher, Social Critic"
      },
      "text": "I am looking for an honest man.",
      "shortVersion": "Seeking one honest person in all Athens.",
      "source": "Diogenes Laertius, Lives of Eminent Philosophers, Book 6",
      "context": "Diogenes famously walked through Athens in daylight carrying a lamp, claiming to search for an honest man. When asked what he was doing, he replied he was looking for a human being - implying that despite the crowded streets, he found none who lived with integrity. This theatrical act exemplified Cynic philosophy: using shocking performance to expose society's moral bankruptcy.",
      "modernInterpretation": "In an era of influencer culture, political spin, and corporate greenwashing, Diogenes's lamp search feels timeless. How many people live with radical authenticity versus performing a curated persona? The Cynic asks: beneath the Instagram filters, LinkedIn résumés, and social masks, where is the honest human?",
      "practicalApplication": "Conduct your own 'lamp search': (1) Audit your own authenticity - where do you perform versus live genuinely? (2) Identify one area where you compromise integrity for approval (social media persona, workplace behavior, relationship dynamics). (3) Experiment with radical honesty in one low-stakes situation this week. Notice the freedom.",
      "psychologyConnection": "Relates to Carl Rogers's concept of 'congruence' - alignment between true self and presented self. Also connects to Erving Goffman's 'presentation of self in everyday life' - we all perform social roles. Diogenes challenges: what if you stopped performing? Links to authenticity research in positive psychology (Michael Kernis) and impostor syndrome literature.",
      "relatedThemes": ["Critique of Society", "Virtue in Action", "Shamelessness"],
      "difficultyLevel": "Beginner",
      "reflectionPrompt": "In which parts of your life are you performing an act versus living authentically? What would change if you 'carried a lamp' to your own behavior?",
      "modernExamples": [
        "Social media: We curate highlight reels, not honest lives. Diogenes would post unfiltered reality.",
        "Corporate culture: Mission statements vs actual values. Diogenes exposes the gap.",
        "Political discourse: Spin and talking points vs genuine conviction. Where's the honesty?"
      ]
    }
  ]
}
```

## Technical Implementation Hints

### File to Create

`content/quotes/cynicism-quotes.json`

### Philosopher Distribution

**Diogenes of Sinope (25 quotes):**
- Famous for: Living in a barrel, confronting Alexander the Great, shameless public behavior
- Perspective: Radical rejection of social norms, material simplicity, provocative teaching
- Key stories: "Stand out of my light" to Alexander, masturbating in marketplace, living like a dog
- Modern connection: Anti-consumerism, minimalism, punk ethos, culture jamming

**Crates of Thebes (8 quotes):**
- Famous for: Wealthy man who gave away fortune, marriage to Hipparchia, gentle Cynicism
- Perspective: Practical Cynicism, accessible philosophy, less confrontational than Diogenes
- Key stories: Renounced wealth, married fellow philosopher, lived simply but with joy
- Modern connection: Voluntary simplicity movement, effective altruism, downshifting

**Antisthenes (7 quotes):**
- Famous for: Student of Socrates, teacher of Diogenes, proto-Cynic founder
- Perspective: Bridge between Socrates and Cynicism, virtue as sufficient for happiness
- Key teachings: Self-sufficiency, virtue through hard work, reject luxury
- Modern connection: Virtue ethics, character development, simple living

### Themes Distribution

1. **Radical Simplicity (8 quotes):**
   - Material detachment
   - Living with bare necessities
   - Diogenes's barrel life
   - Philosophers: Diogenes (5), Crates (2), Antisthenes (1)

2. **Shamelessness - Anaideia (7 quotes):**
   - Rejecting social conventions
   - Public behavior that shocks
   - Freedom from shame
   - Philosophers: Diogenes (5), Crates (1), Antisthenes (1)

3. **Self-Sufficiency - Autarkeia (7 quotes):**
   - Independence from needs
   - Internal vs external goods
   - Freedom through detachment
   - Philosophers: Diogenes (4), Antisthenes (2), Crates (1)

4. **Virtue in Action - Arete (6 quotes):**
   - Practice over theory
   - Character through deeds
   - Philosophy as way of life
   - Philosophers: Antisthenes (3), Diogenes (2), Crates (1)

5. **Critique of Society (6 quotes):**
   - Exposing hypocrisy
   - Challenging authority
   - Cultural subversion
   - Philosophers: Diogenes (4), Crates (1), Antisthenes (1)

6. **Freedom & Independence - Eleutheria (5 quotes):**
   - Rejecting social bondage
   - Mental freedom
   - Cosmopolitanism (citizen of world, not city)
   - Philosophers: Diogenes (3), Antisthenes (1), Crates (1)

7. **Living Like a Dog - Kynikos (3 quotes):**
   - Etymology of Cynicism
   - Natural vs artificial life
   - Shameless like dogs
   - Philosophers: Diogenes (2), Antisthenes (1)

### Modern Connections

**Cynicism → Contemporary Movements:**
- **Minimalism** - Diogenes as prototype minimalist (barrel living)
- **Punk/Counter-culture** - Shameless rejection of mainstream values
- **Culture Jamming** - Adbusters, Banksy-style subversive critique
- **Anti-Consumerism** - Buy Nothing movement, degrowth economics
- **Effective Altruism** - Crates giving away wealth for greater good
- **Voluntary Simplicity** - Tiny house movement, van life, digital nomadism
- **Radical Honesty** - Diogenes's lamp search as authenticity movement

## Definition of Done

- [ ] 42+ authentic Cynic quotes from verified sources
- [ ] All 3 philosophers represented (Diogenes: 25, Crates: 8, Antisthenes: 7)
- [ ] All 7 themes covered with minimum counts
- [ ] Every quote includes all 12 required fields
- [ ] Each quote cites primary source (mostly Diogenes Laertius)
- [ ] Each quote includes 2-3 modern examples
- [ ] Connection to contemporary movements (minimalism, punk, culture jamming)
- [ ] JSON validates against schema
- [ ] File saved at `content/quotes/cynicism-quotes.json`
- [ ] Language accessible while honoring provocative Cynic spirit
- [ ] Balance shocking stories with philosophical depth

## Content Quality Guidelines

### Primary Sources
- Diogenes Laertius: *Lives of Eminent Philosophers*, Book 6 (main source)
- Epictetus: *Discourses* (references to Diogenes)
- Dio Chrysostom: Cynic discourses
- Lucian: Satirical dialogues featuring Cynics

### Modern Interpretation Best Practices
- Embrace the provocative spirit without being gratuitous
- Show how Cynic "shamelessness" = freedom from social conditioning
- Connect to modern counter-cultural movements
- Use humor where appropriate (Cynics were witty)
- Avoid romanticizing poverty - focus on voluntary simplicity

### Psychology Connections
- Authentic Self - Carl Rogers, humanistic psychology
- Social Construction of Reality - Berger & Luckmann
- Conformity Studies - Asch, Milgram (Cynics as non-conformists)
- Voluntary Simplicity Research - Duane Elgin
- Minimalism Psychology - minimalism as mental health practice
- Culture Critique - Frankfurt School, Adorno

---

**Labels:** `content`, `copilot-ready`, `quotes`, `cynicism`, `parallel-safe`
