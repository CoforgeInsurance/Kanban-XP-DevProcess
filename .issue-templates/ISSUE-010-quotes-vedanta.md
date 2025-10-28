# Issue: Create Vedanta Philosophy Quotes Dataset

## User Story

As a content creator
I want a comprehensive collection of Vedanta philosophy quotes
So that users can access authentic wisdom with modern context and practical applications

## Acceptance Criteria (BDD Scenarios)

### Scenario 1: Quote structure includes all required fields

```gherkin
Given I am creating quotes from Vedanta philosophers
When I structure each quote
Then each quote should include:
  | Field                    | Description                                  |
  |--------------------------|----------------------------------------------|
  | PhilosopherName          | Full name with tradition                     |
  | Text                     | Original teaching (English)                  |
  | ShortVersion             | Concise version (< 100 chars)                |
  | Source                   | Text/commentary reference                    |
  | Context                  | Philosophical/historical background          |
  | ModernInterpretation     | Contemporary meaning                         |
  | PracticalApplication     | How to apply today                           |
  | PsychologyConnection     | Link to modern psychology                    |
  | RelatedThemes            | Universal themes (tags)                      |
  | DifficultyLevel          | Beginner/Intermediate/Advanced               |
  | ReflectionPrompt         | Question for contemplation                   |
  | SanskritTerm             | Key Sanskrit concept if applicable           |
```

### Scenario 2: Coverage across Vedanta traditions and teachers

```gherkin
Given I am creating a Vedanta quotes collection
When I select philosophers
Then the collection should include quotes from:
  - Adi Shankaracharya (Advaita, 788-820 CE) - 10 quotes
  - Ramanujacharya (Vishishtadvaita, 1017-1137 CE) - 8 quotes
  - Madhvacharya (Dvaita, 1238-1317 CE) - 8 quotes
  - Swami Vivekananda (Neo-Vedanta, 1863-1902 CE) - 6 quotes
  - Ramana Maharshi (Modern Advaita, 1879-1950 CE) - 6 quotes
  - Vallabhacharya (Shuddhadvaita, 1479-1531 CE) - 5 quotes
  - Jiddu Krishnamurti (Independent, 1895-1986 CE) - 7 quotes
And each philosopher should represent their unique school
And diversity of perspectives (Advaita, Dvaita, Qualified Non-dualism, Modern interpretation)
```

### Scenario 3: Thematic diversity and balance

```gherkin
Given I am curating Vedanta quotes
When I organize by themes
Then the collection should cover:
  | Theme                    | Min Quotes | Key Concepts                              |
  |--------------------------|------------|-------------------------------------------|
  | Self-Knowledge (Atman)   | 9          | "Who am I?", consciousness, witness       |
  | Unity & Non-Duality      | 8          | Oneness, Brahman, interconnection         |
  | Maya & Illusion          | 6          | Appearance vs reality, conditioning       |
  | Meditation & Practice    | 7          | Dhyana, self-inquiry, contemplation       |
  | Devotion & Surrender     | 6          | Bhakti, grace, divine relationship        |
  | Freedom (Moksha)         | 5          | Liberation, transcendence                 |
  | Knowledge vs Ignorance   | 5          | Vidya/Avidya, wisdom, awakening           |
  | Service & Karma Yoga     | 4          | Selfless action, duty without attachment  |
And total should be 50+ quotes
```

### Scenario 4: Modern relevance and practical application

```gherkin
Given each Vedanta quote
When I add modern context
Then each quote should include:
  - Concrete modern scenario (identity crisis, purpose-seeking, mindfulness, consciousness studies)
  - Connection to contemporary psychology (self-awareness, identity, consciousness research, transpersonal psychology)
  - Actionable contemplative practice
  - Reflection question for self-inquiry
And language should bridge ancient wisdom with modern terminology
And examples should resonate with spiritual seekers and secular mindfulness practitioners
```

### Scenario 5: Quality and authenticity standards

```gherkin
Given I am sourcing Vedanta quotes
When I validate each quote
Then each quote should:
  - Be from authentic sources (Upanishads, Brahma Sutras, commentaries, direct teachings)
  - Include proper source citation
  - Use reputable translations (Swami Nikhilananda, Eknath Easwaran, etc.)
  - Preserve philosophical nuances of different schools
  - Balance non-dual (Advaita) and devotional (Bhakti) perspectives
And quotes should represent the diversity within Vedanta
```

## Data Format (JSON Schema)

```json
{
  "tradition": "Vedanta",
  "quotes": [
    {
      "id": 1,
      "philosopher": {
        "name": "Ramana Maharshi",
        "school": "Advaita Vedanta (Modern)",
        "era": "1879-1950 CE",
        "role": "Self-Realized Sage"
      },
      "text": "Your own Self-Realization is the greatest service you can render the world.",
      "shortVersion": "Self-realization is the greatest service to humanity.",
      "source": "Talks with Ramana Maharshi, Talk 20",
      "context": "Ramana Maharshi taught self-inquiry (Atma-vichara) as the direct path to realization. When asked about social service and helping the world, he emphasized that true transformation begins with inner awakening. An awakened individual naturally radiates peace and clarity.",
      "modernInterpretation": "In a culture obsessed with external achievement and 'making a difference,' Ramana points to a radical truth: the most profound contribution you can make is becoming conscious, integrated, and awake. Your inner state affects everyone around you more than your résumé.",
      "practicalApplication": "Before rushing to 'fix' the world or others: (1) Ask 'Who am I?' - investigate your true nature beyond roles and conditioning. (2) Dedicate 10-20 minutes daily to self-inquiry or silent sitting. (3) Notice how inner peace naturally affects your relationships and actions. True service flows from being, not doing.",
      "psychologyConnection": "Aligns with Carl Jung's 'individuation' - becoming whole heals collective wounds. Also resonates with attachment theory: secure attachment to self enables secure relationships. Relates to 'psychological safety' research - your inner state creates the emotional field others experience.",
      "relatedThemes": ["Self-Knowledge", "Service & Karma Yoga", "Meditation & Practice"],
      "difficultyLevel": "Intermediate",
      "reflectionPrompt": "Who would you be without the story of who you think you should be? What remains when all roles dissolve?",
      "sanskritTerm": "Atma-vichara (आत्म-विचार) - Self-inquiry",
      "modernExamples": [
        "Activism burnout: Before 'saving the world,' cultivate inner spaciousness so action comes from wholeness, not wound",
        "Parenting: Your emotional regulation teaches children more than any lecture about behavior",
        "Leadership: Your presence and clarity create organizational culture more than policies"
      ]
    }
  ]
}
```

## Technical Implementation Hints

### File to Create

`content/quotes/vedanta-quotes.json`

### Philosopher Distribution & Unique Angles

**Adi Shankaracharya (10 quotes) - Advaita (Non-Dualism):**
- Core teaching: "Brahman alone is real, the world is mithya (apparent), jiva (individual) is non-different from Brahman"
- Unique angle: Radical non-duality, intellectual precision, commentary tradition
- Sources: Vivekachudamani, Brahma Sutra Bhashya, Upanishad commentaries
- Modern connection: Consciousness studies, non-dual awareness practices

**Ramanujacharya (8 quotes) - Vishishtadvaita (Qualified Non-Dualism):**
- Core teaching: Individual souls are real and distinct, but utterly dependent on Brahman; devotional relationship
- Unique angle: Balance of devotion and philosophy, grace emphasis, individual significance
- Sources: Sri Bhashya, Vedartha Sangraha
- Modern connection: Relational identity, meaningful individuality within unity

**Madhvacharya (8 quotes) - Dvaita (Dualism):**
- Core teaching: Eternal distinction between individual soul and God; five fundamental differences
- Unique angle: Personal God, moral realism, devotional intensity
- Sources: Brahma Sutra Bhashya, Anuvyakhyana
- Modern connection: Ethical accountability, personal responsibility, devotional relationship

**Swami Vivekananda (6 quotes) - Neo-Vedanta:**
- Core teaching: Practical Vedanta, strength-based spirituality, service as worship
- Unique angle: East-West bridge, social reform, universal spirituality
- Sources: Complete Works (lectures, letters)
- Modern connection: Self-confidence, potential realization, humanitarian service

**Ramana Maharshi (6 quotes) - Modern Advaita:**
- Core teaching: Self-inquiry (Who am I?), silence as teaching, effortless awareness
- Unique angle: Direct experience over scripture, simplicity, accessibility
- Sources: Talks, Who Am I?, Collected Works
- Modern connection: Mindfulness, presence, non-directive therapy

**Vallabhacharya (5 quotes) - Shuddhadvaita (Pure Non-Dualism):**
- Core teaching: World is real manifestation of Brahman, devotional play (lila), grace (pushti)
- Unique angle: Affirmation of world, joyful devotion, beauty emphasis
- Sources: Anubhashya, Shodasha Granthas
- Modern connection: Embodied spirituality, joy as path, sacred ordinary

**Jiddu Krishnamurti (7 quotes) - Independent/Radical:**
- Core teaching: Freedom from authority, choiceless awareness, psychological revolution
- Unique angle: Anti-guru stance, question everything, direct observation
- Sources: Freedom from the Known, Commentaries on Living
- Modern connection: Critical thinking, psychological freedom, meditation without method

### Themes Distribution Guide

1. **Self-Knowledge (9 quotes):**
   - Atman (true Self) vs ego
   - "Who am I?" inquiry
   - Witness consciousness
   - Philosophers: Ramana (3), Shankara (2), Krishnamurti (2), Vivekananda (1), Vallabha (1)

2. **Unity & Non-Duality (8 quotes):**
   - Brahman (ultimate reality)
   - Oneness of existence
   - Interconnection
   - Philosophers: Shankara (3), Ramanujacharya (2), Vivekananda (2), Vallabha (1)

3. **Maya & Illusion (6 quotes):**
   - Appearance vs reality
   - Conditioning and projection
   - Philosophers: Shankara (2), Krishnamurti (2), Ramana (1), Vivekananda (1)

4. **Meditation & Practice (7 quotes):**
   - Dhyana (meditation)
   - Self-inquiry techniques
   - Contemplation
   - Philosophers: Ramana (2), Krishnamurti (2), Madhva (1), Vivekananda (1), Shankara (1)

5. **Devotion & Surrender (6 quotes):**
   - Bhakti yoga
   - Grace (prasada)
   - Divine relationship
   - Philosophers: Ramanuja (2), Madhva (2), Vallabha (2)

6. **Freedom (Moksha) (5 quotes):**
   - Liberation from suffering
   - Transcendence
   - Philosophers: Shankara (1), Krishnamurti (2), Ramana (1), Vivekananda (1)

7. **Knowledge vs Ignorance (5 quotes):**
   - Vidya/Avidya
   - Awakening
   - Philosophers: Shankara (2), Ramanuja (1), Madhva (1), Krishnamurti (1)

8. **Service & Karma Yoga (4 quotes):**
   - Selfless action
   - Work as worship
   - Philosophers: Vivekananda (2), Ramanuja (1), Vallabha (1)

### Sanskrit Terms to Include

- **Atman** (आत्मन्) - True Self, consciousness
- **Brahman** (ब्रह्मन्) - Ultimate Reality
- **Maya** (माया) - Illusion, appearance
- **Moksha** (मोक्ष) - Liberation
- **Vidya/Avidya** (विद्या/अविद्या) - Knowledge/Ignorance
- **Jnana** (ज्ञान) - Knowledge, wisdom
- **Bhakti** (भक्ति) - Devotion
- **Karma** (कर्म) - Action
- **Dhyana** (ध्यान) - Meditation
- **Atma-vichara** (आत्म-विचार) - Self-inquiry

## Definition of Done

- [ ] 50+ authentic Vedanta quotes from verified sources
- [ ] All 7 philosophers represented with specified distribution
- [ ] All 8 themes covered with minimum quote counts
- [ ] Every quote includes all 12 required fields
- [ ] Each quote cites primary source
- [ ] Sanskrit terms included where appropriate with transliteration
- [ ] Each quote includes 2-3 modern examples
- [ ] Balanced representation of Advaita (non-dual) and Bhakti (devotional) perspectives
- [ ] Connection to modern psychology/consciousness studies
- [ ] JSON validates against schema
- [ ] File saved at `content/quotes/vedanta-quotes.json`
- [ ] Diversity of schools represented (Advaita, Vishishtadvaita, Dvaita, Neo-Vedanta, Modern)
- [ ] Language accessible to Western audience while preserving authenticity

## Content Quality Guidelines

### Translation Sources
- Upanishads: Eknath Easwaran, Swami Nikhilananda
- Shankara: Swami Gambhirananda, A.J. Alston
- Ramanuja: Swami Adidevananda, J.A.B. van Buitenen
- Madhva: S.S. Raghavachar
- Vivekananda: Complete Works (Advaita Ashrama)
- Ramana Maharshi: David Godman compilations, Arthur Osborne
- Krishnamurti: Krishnamurti Foundation official publications

### Modern Interpretation Best Practices
- Bridge ancient terminology with contemporary language
- Use examples from identity crisis, purpose-seeking, consciousness exploration
- Connect to mindfulness movement while honoring depth
- Avoid cultural appropriation - cite sources, use Sanskrit respectfully
- Make it relevant to both spiritual seekers and secular practitioners

### Psychology Connections
- Transpersonal Psychology - Abraham Maslow, Stanislav Grof
- Self-Determination Theory - autonomy, competence, relatedness
- Consciousness Studies - hard problem of consciousness, integrated information theory
- Mindfulness-Based Therapies - MBSR, MBCT
- Positive Psychology - self-transcendence, flow states
- Attachment Theory - secure base, internal working models
- Jungian Psychology - individuation, Self archetype
- Existential-Humanistic - Viktor Frankl, Rollo May

---

**Labels:** `content`, `copilot-ready`, `quotes`, `vedanta`, `parallel-safe`
