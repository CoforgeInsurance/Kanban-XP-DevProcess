# Issue: Create Stoic Philosophy Quotes Dataset

## User Story

As a content creator
I want a comprehensive collection of Stoic philosophy quotes
So that users can access authentic wisdom with modern context and practical applications

## Acceptance Criteria (BDD Scenarios)

### Scenario 1: Quote structure includes all required fields

```gherkin
Given I am creating quotes from Stoic philosophers
When I structure each quote
Then each quote should include:
  | Field                    | Description                                  | Example                                    |
  |--------------------------|----------------------------------------------|--------------------------------------------|
  | PhilosopherName          | Full name                                    | "Marcus Aurelius"                          |
  | Text                     | Original quote (English translation)         | "You have power over your mind..."         |
  | ShortVersion             | Concise version (< 100 chars)                | "You control your mind, not events."       |
  | Source                   | Book/letter reference                        | "Meditations, Book 8, Section 32"          |
  | Context                  | Historical/situational background            | "Written during Marcomannic Wars..."       |
  | ModernInterpretation     | Contemporary meaning                         | "In today's world of information overload" |
  | PracticalApplication     | How to apply today                           | "When facing rejection at work..."         |
  | PsychologyConnection     | Link to modern psychology                    | "Aligns with CBT's cognitive reframing"    |
  | RelatedThemes            | Universal themes (tags)                      | ["Resilience", "Control", "Acceptance"]    |
  | DifficultyLevel          | Beginner/Intermediate/Advanced               | "Beginner"                                 |
  | ReflectionPrompt         | Question for contemplation                   | "What can you control right now?"          |
```

### Scenario 2: Coverage across major Stoic philosophers

```gherkin
Given I am creating a Stoic quotes collection
When I select philosophers
Then the collection should include quotes from:
  - Marcus Aurelius (Emperor, 121-180 CE) - 15 quotes minimum
  - Epictetus (Slave-turned-teacher, 50-135 CE) - 15 quotes minimum
  - Seneca (Statesman, 4 BCE-65 CE) - 15 quotes minimum
  - Musonius Rufus (Teacher, 30-100 CE) - 5 quotes minimum
And each philosopher should have diverse topic coverage
And quotes should represent their unique perspective within Stoicism
```

### Scenario 3: Thematic diversity and balance

```gherkin
Given I am curating Stoic quotes
When I organize by themes
Then the collection should cover:
  | Theme                    | Min Quotes | Description                               |
  |--------------------------|------------|-------------------------------------------|
  | Control & Acceptance     | 8          | Dichotomy of control                      |
  | Virtue & Character       | 7          | Living according to nature                |
  | Resilience & Adversity   | 7          | Amor fati, negative visualization         |
  | Mindfulness & Presence   | 6          | Premeditatio malorum, memento mori        |
  | Relationships & Service  | 5          | Cosmopolitanism, social duty              |
  | Simplicity & Moderation  | 5          | Material detachment                       |
  | Wisdom & Philosophy      | 5          | Love of wisdom, continuous learning       |
  | Death & Mortality        | 4          | Memento mori                              |
  | Anger & Emotions         | 3          | Emotional regulation                      |
And total should be 50+ quotes
```

### Scenario 4: Modern relevance and practical application

```gherkin
Given each Stoic quote
When I add modern context
Then each quote should include:
  - At least one concrete modern scenario (workplace, relationships, health, social media, etc.)
  - Connection to contemporary psychology (CBT, ACT, mindfulness, resilience research)
  - Actionable step a reader can take today
  - Reflection question for deeper contemplation
And language should be accessible to modern readers
And examples should resonate with 21st century challenges
```

### Scenario 5: Quality and authenticity standards

```gherkin
Given I am sourcing Stoic quotes
When I validate each quote
Then each quote should:
  - Be from authentic historical sources (Meditations, Discourses, Letters, etc.)
  - Include proper source citation
  - Use reputable translations (George Long, Robin Hard, Margaret Graver)
  - Avoid misattributions or modern fabrications
  - Preserve original meaning while being accessible
And quotes should be verified against primary texts
```

## Data Format (JSON Schema)

```json
{
  "tradition": "Stoicism",
  "quotes": [
    {
      "id": 1,
      "philosopher": {
        "name": "Marcus Aurelius",
        "era": "Roman Empire (121-180 CE)",
        "role": "Emperor and Philosopher"
      },
      "text": "You have power over your mind - not outside events. Realize this, and you will find strength.",
      "shortVersion": "You control your mind, not events outside it.",
      "source": "Meditations, Book 8, Section 32",
      "context": "Written during the Marcomannic Wars (166-180 CE), Marcus reflects on maintaining inner peace amid external chaos. As emperor facing plague, war, and betrayal, he reminds himself of the fundamental Stoic principle.",
      "modernInterpretation": "In today's world of 24/7 news cycles, social media, and constant uncertainty, this quote reminds us that our mental state is the one domain we truly govern. External events may be beyond our control, but our interpretation and response remain ours.",
      "practicalApplication": "When facing job rejection, relationship conflict, or unexpected setbacks: (1) Pause and identify what you can control (your effort, attitude, next action) versus what you cannot (other people's decisions, outcomes, timing). (2) Redirect energy from worrying about the uncontrollable to improving the controllable. (3) Practice the Stoic 'reserve clause' - 'I will do X, fate permitting.'",
      "psychologyConnection": "This aligns with Cognitive Behavioral Therapy (CBT), where changing thought patterns changes emotional responses. Also relates to the 'locus of control' concept in psychology - internal vs external attribution.",
      "relatedThemes": ["Control & Acceptance", "Resilience", "Mindfulness"],
      "difficultyLevel": "Beginner",
      "reflectionPrompt": "Right now, what are you worrying about that is outside your control? What could you do instead with that mental energy?",
      "modernExamples": [
        "Social media negativity: You can't control what others post, but you can control your scrolling habits and reactions",
        "Work stress: You can't control your boss's mood, but you can control your work quality and professional boundaries",
        "Health anxiety: You can't control every health outcome, but you can control daily habits (sleep, exercise, nutrition)"
      ]
    }
  ]
}
```

## Technical Implementation Hints

### File to Create

Create this file: `content/quotes/stoicism-quotes.json`

### Philosopher Distribution

**Marcus Aurelius (15 quotes):**
- Famous for: *Meditations* (personal journal)
- Perspective: Emperor's burden, duty, mortality
- Unique angle: Leadership under pressure, managing power virtuously
- Key works: *Meditations* (Books 2-12 most quoted)

**Epictetus (15 quotes):**
- Famous for: *Discourses*, *Enchiridion* (Manual)
- Perspective: Former slave's wisdom, teaching-focused
- Unique angle: Radical freedom through acceptance, teacher-student dialogue
- Key works: *Discourses* (Books 1-4), *Enchiridion*

**Seneca (15 quotes):**
- Famous for: *Letters to Lucilius*, *On the Shortness of Life*
- Perspective: Wealthy statesman's inner conflict, practical ethics
- Unique angle: Navigating wealth/power while staying virtuous, letter format
- Key works: *Letters to Lucilius*, *On Anger*, *On the Happy Life*

**Musonius Rufus (5 quotes):**
- Famous for: Teacher of Epictetus, progressive views
- Perspective: Women's education, simple living, vegetarianism
- Unique angle: Ahead of his time on gender equality, practical virtue
- Key works: Fragments preserved by students

### Themes to Cover

1. **Control & Acceptance (8 quotes):**
   - Dichotomy of control
   - Amor fati (love of fate)
   - Premeditatio malorum (negative visualization)

2. **Virtue & Character (7 quotes):**
   - Four cardinal virtues: Wisdom, Courage, Justice, Temperance
   - Living according to nature
   - Character over reputation

3. **Resilience & Adversity (7 quotes):**
   - Obstacle as opportunity
   - Voluntary discomfort
   - Mental fortitude

4. **Mindfulness & Presence (6 quotes):**
   - Focus on present moment
   - Morning/evening reflection
   - Attention management

5. **Relationships & Service (5 quotes):**
   - Cosmopolitanism
   - Social duty
   - Dealing with difficult people

6. **Simplicity & Moderation (5 quotes):**
   - Material detachment
   - Voluntary simplicity
   - Luxury as weakness

7. **Wisdom & Philosophy (5 quotes):**
   - Love of wisdom
   - Continuous learning
   - Philosophy as medicine for the soul

8. **Death & Mortality (4 quotes):**
   - Memento mori
   - Death as natural
   - Living as if each day is last

9. **Anger & Emotions (3 quotes):**
   - Emotional regulation
   - Delay before reaction
   - Managing provocations

### Example Quote Template (Full Detail)

```json
{
  "id": 1,
  "philosopher": {
    "name": "Epictetus",
    "era": "Roman Empire (50-135 CE)",
    "role": "Former Slave, Stoic Teacher"
  },
  "text": "We cannot choose our external circumstances, but we can always choose how we respond to them.",
  "shortVersion": "Choose your response, not your circumstances.",
  "source": "Enchiridion, Section 1",
  "context": "Epictetus opens his famous manual with the foundational Stoic teaching: the dichotomy of control. Born a slave, he understood powerlessness over externals but discovered absolute power over internal responses. This teaching became the core of Stoic practice.",
  "modernInterpretation": "In the age of algorithms controlling our feeds, bosses controlling our schedules, and countless external forces shaping our days, Epictetus reminds us: while we can't curate reality itself, we retain absolute authority over our interpretation and response. This is the ultimate freedom.",
  "practicalApplication": "Next time you face traffic, a rude email, or unexpected change: (1) Name the external (the thing you can't control). (2) Identify your response options (the thing you CAN control). (3) Choose consciously. Example: Traffic jam (external) → You can choose: frustration + road rage OR audiobook + acceptance. Same situation, radically different experience.",
  "psychologyConnection": "This is the foundation of Cognitive Behavioral Therapy (CBT) and Albert Ellis's Rational Emotive Behavior Therapy (REBT). The ABC model: Activating event → Belief about it → Consequent emotion. We can't always change A, but we can reshape B, which changes C. Also relates to Viktor Frankl's 'space between stimulus and response.'",
  "relatedThemes": ["Control & Acceptance", "Resilience", "Emotional Regulation"],
  "difficultyLevel": "Beginner",
  "reflectionPrompt": "Think of a recent frustration. What was the external event? What was your automatic response? What alternative response was available to you?",
  "modernExamples": [
    "Email overload: Can't control incoming volume, CAN control notification settings and response times",
    "Political anxiety: Can't control election outcomes, CAN control media consumption and local action",
    "Relationship conflict: Can't control partner's behavior, CAN control your communication style and boundaries"
  ]
}
```

## Definition of Done

- [ ] 50+ authentic Stoic quotes collected from verified sources
- [ ] All 4 philosophers represented (Marcus: 15, Epictetus: 15, Seneca: 15, Musonius: 5)
- [ ] All 9 themes covered with minimum quote counts met
- [ ] Every quote includes all 12 required fields (text, shortVersion, source, context, modernInterpretation, practicalApplication, psychologyConnection, relatedThemes, difficultyLevel, reflectionPrompt, modernExamples, philosopher details)
- [ ] Each quote cites primary source (book, section number)
- [ ] Each quote includes 2-3 concrete modern examples
- [ ] Each quote connects to at least one psychological framework (CBT, ACT, positive psychology, etc.)
- [ ] JSON file validates against schema
- [ ] File saved at `content/quotes/stoicism-quotes.json`
- [ ] Peer review confirms accuracy of attributions
- [ ] Language is accessible to modern readers (avoid archaic phrasing)
- [ ] No duplicate quotes or redundant themes

## Content Quality Guidelines

### Translation Sources (Use These)
- Marcus Aurelius: Gregory Hays (Modern Library, 2002) or Robin Hard (Oxford, 2011)
- Epictetus: Robin Hard (Oxford, 2014) or George Long (public domain)
- Seneca: Robin Campbell (Penguin Classics) or Margaret Graver (Chicago, 2015)
- Musonius Rufus: Cynthia King translation (CreateSpace, 2011)

### Modern Interpretation Best Practices
- Use contemporary examples (social media, remote work, mental health, climate anxiety)
- Avoid political partisanship
- Make it relatable to 25-45 age demographic
- Include diverse scenarios (work, family, health, technology, society)
- Be concrete, not abstract

### Psychology Connections to Explore
- Cognitive Behavioral Therapy (CBT) - Aaron Beck, Albert Ellis
- Acceptance and Commitment Therapy (ACT) - Steven Hayes
- Positive Psychology - Martin Seligman (PERMA model)
- Resilience Research - Angela Duckworth (Grit)
- Mindfulness-Based Stress Reduction (MBSR) - Jon Kabat-Zinn
- Locus of Control - Julian Rotter
- Flow State - Mihaly Csikszentmihalyi
- Existential Psychology - Viktor Frankl (*Man's Search for Meaning*)

---

**Labels:** `content`, `copilot-ready`, `quotes`, `stoicism`, `parallel-safe`
