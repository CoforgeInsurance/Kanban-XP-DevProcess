# Issue: Create Philosopher Biography Dataset

## User Story

As a content creator
I want comprehensive biographies of philosophers from all traditions
So that users understand the historical context and human stories behind the wisdom

## Acceptance Criteria (BDD Scenarios)

### Scenario 1: Biography structure includes all required fields

```gherkin
Given I am creating philosopher biographies
When I structure each biography
Then each biography should include:
  | Field                    | Description                                  |
  |--------------------------|----------------------------------------------|
  | Name                     | Full name with honorifics if appropriate     |
  | Tradition                | Primary philosophical tradition              |
  | BirthYear / DeathYear    | CE dates (approximate if uncertain)          |
  | Era                      | Historical period context                    |
  | Biography                | 300-500 word life story (3-4 paragraphs)     |
  | MajorWorks               | Key texts/teachings                          |
  | KeyTeachings             | Core philosophical contributions             |
  | Legacy                   | Influence and impact                         |
  | PersonalChallenges       | Struggles, adversity faced                   |
  | HistoricalContext        | Political/cultural backdrop                  |
  | ModernRelevance          | Why they matter today                        |
  | ImageUrl                 | Public domain portrait if available          |
  | InterestingFacts         | 3-5 compelling details                       |
```

### Scenario 2: Coverage across all 7 traditions

```gherkin
Given I am creating philosopher biographies
When I select philosophers
Then the collection should include representatives from:
  | Tradition    | Philosophers                                  | Count |
  |--------------|-----------------------------------------------|-------|
  | Stoicism     | Marcus Aurelius, Epictetus, Seneca, Musonius | 4     |
  | Cynicism     | Diogenes, Crates, Antisthenes                 | 3     |
  | Epicureanism | Epicurus, Lucretius                           | 2     |
  | Buddhism     | Buddha, Nagarjuna, Dogen, Thich Nhat Hanh    | 4     |
  | Vedanta      | Shankara, Ramanuja, Madhva, Vivekananda, Ramana, Vallabha, Krishnamurti | 7 |
  | Taoism       | Laozi, Zhuangzi, Liezi                        | 3     |
  | Sufism       | Rumi, Ibn Arabi, Al-Ghazali, Rabia            | 4     |
And total should be 27+ philosophers
```

### Scenario 3: Biography depth and narrative quality

```gherkin
Given each philosopher biography
When I write the life story
Then the biography should include:
  - Opening hook (compelling entry point)
  - Birth circumstances and early life
  - Pivotal moments or turning points
  - Major teachings development
  - Personal struggles or adversity
  - Death circumstances (where known)
  - Lasting impact
And narrative should be engaging, not just facts
And tone should be respectful but humanizing
And length should be 300-500 words (readable in 2-3 minutes)
```

### Scenario 4: Historical accuracy and authenticity

```gherkin
Given I am writing philosopher biographies
When I research each figure
Then each biography should:
  - Cite reputable historical sources
  - Distinguish fact from legend where uncertain
  - Acknowledge historical debates or uncertainties
  - Use accurate dates (CE format, "c." for circa)
  - Provide cultural/political context
  - Avoid hagiography (overly reverential tone)
And sources should include academic scholarship
And legends should be noted as such
```

### Scenario 5: Modern relevance and accessibility

```gherkin
Given each philosopher biography
When I explain modern relevance
Then the explanation should:
  - Connect to contemporary issues (mental health, meaning crisis, technology, etc.)
  - Explain why this figure matters today
  - Use language accessible to modern readers
  - Avoid academic jargon unless necessary
  - Include 3-5 interesting/surprising facts
And modern relevance should be 100-150 words
```

## Data Format (JSON Schema)

```json
{
  "philosophers": [
    {
      "id": 1,
      "name": "Epictetus",
      "tradition": "Stoicism",
      "birthYear": 50,
      "deathYear": 135,
      "era": "Roman Empire (1st-2nd century CE)",
      "biography": "Born into slavery around 50 CE in Hierapolis (modern-day Turkey), Epictetus lived the first decades of his life as property of Epaphroditus, a wealthy freedman and secretary to Emperor Nero. His very name, 'Epictetus,' means 'acquired' - he was literally labeled as purchased property. Despite these dehumanizing circumstances, he found an unlikely path to philosophy through his master's permission to study with the Stoic teacher Musonius Rufus.\n\nAfter gaining his freedom (possibly after Epaphroditus's death), Epictetus established his own school in Rome, teaching philosophy until Emperor Domitian banished all philosophers around 93 CE. He relocated to Nicopolis in Greece, where he taught for the rest of his life. Remarkably, Epictetus wrote nothing himself - all his teachings survive through his student Arrian's notes, compiled as the 'Discourses' and the 'Enchiridion' (Handbook).\n\nHis philosophy centered on the radical freedom available even in chains: while we cannot control external circumstances, we retain absolute sovereignty over our judgments, desires, and responses. Having lived powerlessness, he taught power. Having experienced bondage, he taught liberation through acceptance. His school attracted students from across the Roman world, and his influence extended through Marcus Aurelius (who never met him but studied his works intensely) down to modern Cognitive Behavioral Therapy.\n\nEpictetus died peacefully around 135 CE, leaving behind a legacy that transformed imprisonment into a metaphor for the human condition - and acceptance into the key that unlocks every cage.",
      "majorWorks": [
        "Discourses (4 books, recorded by Arrian)",
        "Enchiridion / Handbook (manual of Stoic practice)"
      ],
      "keyTeachings": [
        "Dichotomy of Control: Some things are up to us, some are not",
        "Prohairesis: The faculty of choice, our true self",
        "Impressions: Distinguish between events and judgments about events",
        "Premeditation: Mentally rehearse challenges to build resilience",
        "Roles: Accept your role in life's drama, play it well"
      ],
      "legacy": "Epictetus's teachings became foundational to Stoicism's survival beyond antiquity. His Enchiridion was used as a moral manual in Christian monasteries for centuries. Modern Cognitive Behavioral Therapy (CBT), developed by Aaron Beck and Albert Ellis, directly parallels Epictetus's teaching that beliefs, not events, determine emotions. His work influenced James Stockdale (Vietnam POW), Viktor Frankl (Holocaust survivor), and countless individuals seeking freedom in constraint.",
      "personalChallenges": [
        "Born into slavery, treated as property for ~30 years",
        "Disabled leg (possibly from abuse, possibly congenital)",
        "Exiled from Rome under Domitian's philosopher purge",
        "Never married or had children (by choice)",
        "Lived in poverty by choice despite fame"
      ],
      "historicalContext": "Lived during the height of Roman imperial power under the Flavian and Nerva-Antonine dynasties. Slavery was ubiquitous - estimated 10-20% of Roman population were enslaved. Philosophy was becoming increasingly practical and therapeutic rather than purely theoretical. Political instability under Domitian led to intellectual persecution.",
      "modernRelevance": "In an age of algorithm-driven newsfeeds, social comparison, and external validation addiction, Epictetus's teaching feels prophetic: you control your mind, not the world. His former slave teaching emperors about freedom resonates with modern inequality and the search for agency. CBT therapists essentially teach Epictetus. His focus on what we can control speaks to anxiety epidemics, climate doom, and political polarization - all externals beyond individual control, all requiring internal response.",
      "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/0/00/Epicteti_Enchiridion_Latinis_versibus_adumbratum_%28Oxford_1715%29_frontispiece.jpg",
      "interestingFacts": [
        "His name literally means 'acquired one' or 'purchased' - a label of his enslaved status",
        "Legend says his master broke his leg in abuse, and Epictetus calmly warned it would break before it snapped",
        "He owned almost nothing - one lamp, after which a thief stole it, so he replaced it with an earthenware one",
        "Marcus Aurelius quotes him more than any other philosopher in Meditations despite never meeting him",
        "His teachings survived only because a student took detailed notes - he wrote nothing himself",
        "Admiral James Stockdale credited Epictetus with helping him survive 7+ years as Vietnam POW"
      ]
    }
  ]
}
```

## Technical Implementation Hints

### File to Create

`content/biographies/philosophers.json`

### Biography Writing Guidelines

**Structure (300-500 words, 3-4 paragraphs):**

1. **Opening Hook (Paragraph 1, 80-120 words):**
   - Start with compelling detail or paradox
   - Establish birth/early circumstances
   - Create immediate interest
   - Example: "Born into slavery..." (Epictetus)

2. **Life Journey (Paragraph 2, 100-150 words):**
   - Pivotal moments, turning points
   - Development of teachings
   - Major life events
   - Relationships, influences

3. **Philosophical Contribution (Paragraph 3, 80-120 words):**
   - Core teachings emergence
   - Major works
   - Teaching style or method
   - Unique perspective

4. **Death & Legacy (Paragraph 4, 60-100 words):**
   - Death circumstances (where known)
   - Immediate and long-term impact
   - Bridge to modern relevance

**Tone & Style:**
- Narrative, not encyclopedic
- Humanize without hagiography
- Show struggle and humanity
- Use vivid details
- Active voice preferred
- Present philosopher as real person, not marble statue

### Historical Context Examples

- **Stoics (Marcus, Epictetus, Seneca):** Roman Empire, slavery, political instability, Pax Romana
- **Buddha:** Vedic India, Brahmanical orthodoxy, renunciant movement, caste system
- **Sufis (Rumi, Ibn Arabi):** Islamic Golden Age, Mongol invasions, Ottoman Empire
- **Cynics (Diogenes):** Post-Alexandrian Greece, rise of Hellenistic kingdoms
- **Taoists (Laozi, Zhuangzi):** Warring States period, Confucian orthodoxy
- **Vedanta teachers:** British colonial India (Vivekananda), medieval temple traditions (Ramanuja, Madhva)

### Interesting Facts Guidelines

For each philosopher, include 3-5 facts that are:
- Surprising or counterintuitive
- Humanizing (quirks, habits, preferences)
- Historically verifiable (or noted as legend)
- Relevant to teachings (show practice, not just theory)
- Memorable (stories people will retell)

Examples:
- Diogenes living in a barrel, telling Alexander the Great to stop blocking his sun
- Marcus Aurelius writing Meditations in a tent during war, never intending publication
- Rumi's transformation after meeting Shams (burned his books, started dancing)
- Buddha trying extreme asceticism, nearly dying, then choosing Middle Way

### Modern Relevance Prompts (100-150 words each)

Answer these for each philosopher:
- Why does this person matter in 2025?
- What modern problem does their teaching address?
- Who reads them today and why?
- What's the contemporary parallel to their life challenge?

Examples:
- **Epictetus:** Anxiety epidemics, CBT therapy, agency in powerlessness, Viktor Frankl parallels
- **Seneca:** Wealth/ethics tension, mindful living in comfort, time management (On the Shortness of Life)
- **Marcus Aurelius:** Leadership under pressure, Stoic CEO movement, Ryan Holiday's popularization
- **Ramana Maharshi:** Mindfulness movement, Advaita in West, self-inquiry practices
- **Rumi:** Interfaith dialogue, poetry as spirituality, love mysticism, pop culture presence

## Definition of Done

- [ ] 27+ philosopher biographies completed
- [ ] All 7 traditions represented with minimum counts
- [ ] Each biography 300-500 words (engaging narrative)
- [ ] All 13 required fields populated for each philosopher
- [ ] Historical accuracy verified with academic sources
- [ ] Modern relevance section 100-150 words per philosopher
- [ ] 3-5 interesting facts per philosopher
- [ ] JSON validates against schema
- [ ] File saved at `content/biographies/philosophers.json`
- [ ] Public domain images sourced where available
- [ ] Dates in CE format with "c." for circa
- [ ] Fact vs legend distinguished clearly
- [ ] Peer review for historical accuracy and narrative quality
- [ ] Language accessible to general audience
- [ ] Diverse representation (gender, geography, era) considered

## Research Sources

### Academic References
- Stanford Encyclopedia of Philosophy (plato.stanford.edu)
- Internet Encyclopedia of Philosophy (iep.utm.edu)
- Oxford Classical Dictionary
- Cambridge Companions (to Stoicism, Buddhism, etc.)
- Biographies by scholars (A.A. Long, Pierre Hadot, etc.)

### Primary Sources
- Philosopher's own writings (where available)
- Contemporary accounts (Diogenes Laertius, etc.)
- Letters, recorded dialogues

### Image Sources (Public Domain)
- Wikimedia Commons
- Internet Archive
- Digital collections (Getty, British Library, etc.)

---

**Labels:** `content`, `copilot-ready`, `biographies`, `research`, `parallel-safe`
