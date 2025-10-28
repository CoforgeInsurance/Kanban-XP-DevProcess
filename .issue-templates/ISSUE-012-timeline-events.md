# Issue: Create Philosophical Timeline Events Dataset

## User Story

As a content creator
I want a chronological timeline of key events in philosophical history
So that users can understand the historical context and evolution of wisdom traditions

## Acceptance Criteria (BDD Scenarios)

### Scenario 1: Timeline event structure includes all required fields

```gherkin
Given I am creating philosophical timeline events
When I structure each event
Then each event should include:
  | Field                    | Description                                  |
  |--------------------------|----------------------------------------------|
  | Year                     | BCE/CE year (negative for BCE)               |
  | Title                    | Concise event name (< 80 chars)              |
  | Description              | 150-250 word explanation                     |
  | Tradition                | Primary tradition(s) affected                |
  | EventType                | Birth, Death, Work, Teaching, Historical     |
  | Significance             | Why this event matters                       |
  | RelatedPhilosophers      | Array of philosopher names                   |
  | RelatedWorks             | Array of text titles                         |
  | GeographicLocation       | City/region                                  |
  | ModernParallel           | Contemporary equivalent or echo              |
  | ImageUrl                 | Relevant image if available                  |
```

### Scenario 2: Coverage across all traditions and eras

```gherkin
Given I am creating a philosophical timeline
When I select events
Then the timeline should include events from:
  | Era                      | Date Range    | Min Events | Key Developments                    |
  |--------------------------|---------------|------------|-------------------------------------|
  | Ancient Foundations      | 600 BCE - 0   | 15         | Buddha, Laozi, Socrates, Stoics     |
  | Classical & Medieval     | 1 - 1400 CE   | 12         | Marcus, Plotinus, Shankara, Rumi    |
  | Renaissance & Reform     | 1400 - 1800   | 8          | Ramanuja, Madhva, Vallabha          |
  | Modern & Contemporary    | 1800 - 2000   | 10         | Vivekananda, Ramana, Krishnamurti   |
And total should be 45+ events
And events should span 2,600+ years (600 BCE to 2000 CE)
```

### Scenario 3: Event type diversity

```gherkin
Given I am curating timeline events
When I categorize by type
Then the collection should include:
  | EventType                | Min Events | Examples                                  |
  |--------------------------|------------|-------------------------------------------|
  | Birth                    | 10         | Birth of Buddha, Marcus Aurelius          |
  | Death                    | 8          | Death of Seneca, Shankara's samadhi       |
  | Work Published/Created   | 12         | Meditations written, Upanishads composed  |
  | Teaching Event           | 8          | Buddha's first sermon, Epictetus's school |
  | Historical Milestone     | 7          | Alexander meets Diogenes, Mongol invasion |
And each event should clearly indicate its type
```

### Scenario 4: Modern parallels and relevance

```gherkin
Given each timeline event
When I add modern context
Then each event should include:
  - Contemporary parallel or echo (similar modern event)
  - Why this historical event matters today
  - How it shaped current thought
And modern parallels should be creative and insightful
And language should bridge ancient and modern contexts
```

### Scenario 5: Chronological accuracy and scholarly rigor

```gherkin
Given I am dating historical events
When I research each event
Then each event should:
  - Use BCE/CE notation (negative numbers for BCE in JSON)
  - Include "c." for approximate dates
  - Cite historical sources
  - Acknowledge date uncertainties where applicable
  - Provide geographic and political context
And dates should be verified against multiple scholarly sources
```

## Data Format (JSON Schema)

```json
{
  "timelineEvents": [
    {
      "id": 1,
      "year": -563,
      "yearDisplay": "c. 563 BCE",
      "title": "Birth of Siddhartha Gautama (Buddha)",
      "description": "Born as Prince Siddhartha in Lumbini (modern Nepal) into the Shakya clan, the future Buddha grew up in luxury, shielded from suffering by his father King Suddhodana. Prophecies predicted he would become either a great king or a spiritual teacher. His father, preferring the former, created an artificial paradise to prevent exposure to life's harsh realities. This sheltered upbringing would later make his encounters with aging, sickness, and death profoundly transformative, setting the stage for his spiritual quest. The contrast between palace luxury and the reality of human suffering became Buddhism's foundational insight: dukkha (unsatisfactoriness) pervades even privileged existence.",
      "tradition": ["Buddhism"],
      "eventType": "Birth",
      "significance": "Marks the beginning of Buddhist tradition, which would become one of the world's major wisdom traditions, influencing over 500 million people and profoundly shaping Asian philosophy, psychology, and culture for 2,500+ years.",
      "relatedPhilosophers": ["Siddhartha Gautama (Buddha)"],
      "relatedWorks": [],
      "geographicLocation": "Lumbini, Shakya Kingdom (modern Nepal)",
      "historicalContext": "Vedic period in India, pre-Mauryan kingdoms, rise of shramana (renunciant) movements challenging Brahmanical orthodoxy",
      "modernParallel": "Similar to modern 'privileged' individuals (celebrities, tech billionaires) experiencing existential crisis despite material success and seeking meaning beyond comfort - Buddha as prototype of 'successful person who questions success itself.'",
      "imageUrl": "https://example.com/buddha-birth.jpg",
      "sources": [
        "Buddhist scriptures (Pali Canon)",
        "Scholarly consensus (dates approximate)"
      ]
    },
    {
      "id": 2,
      "year": -399,
      "yearDisplay": "399 BCE",
      "title": "Death of Socrates",
      "description": "Socrates, the foundational figure of Western philosophy, was executed by hemlock poisoning in Athens at age 70. Charged with 'corrupting the youth' and 'impiety' (not believing in the city's gods), he was tried by a jury of 500 Athenian citizens and narrowly convicted. Given the option to propose an alternative punishment, Socrates provocatively suggested he be honored with free meals at public expense for his service to Athens. The jury, insulted, condemned him to death. Refusing opportunities to escape (his friend Crito arranged it), Socrates insisted on obeying Athenian law, even when unjust. He spent his final hours discussing the immortality of the soul with friends, then drank the hemlock calmly, reportedly saying 'I owe a rooster to Asclepius' (the god of healing) - suggesting death cures life's disease. His dignified death became philosophy's founding martyrdom, demonstrating that truth matters more than survival.",
      "tradition": ["Stoicism", "Cynicism"],
      "eventType": "Death",
      "significance": "Socrates's death became the ultimate example of philosophical integrity - choosing death over compromising principles. His student Plato immortalized this event, making Socrates Western philosophy's patron saint. His method (Socratic questioning) and ethics (virtue is knowledge) shaped all subsequent Western thought. The Stoics and Cynics claimed him as spiritual ancestor.",
      "relatedPhilosophers": ["Socrates", "Plato", "Antisthenes (Cynic founder)"],
      "relatedWorks": ["Plato's Apology", "Plato's Phaedo", "Plato's Crito"],
      "geographicLocation": "Athens, Greece",
      "historicalContext": "Post-Peloponnesian War Athens, democracy restored after oligarchic tyranny, political instability, Socrates associated with oligarchs",
      "modernParallel": "Whistleblowers or dissidents facing consequences for speaking truth to power (Snowden, Navalny, etc.). The trial parallels modern 'cancel culture' or political prosecution of intellectuals. His refusal to escape mirrors civil disobedience traditions (Gandhi, MLK) - accepting punishment to highlight injustice.",
      "imageUrl": "https://example.com/socrates-death.jpg",
      "sources": [
        "Plato's dialogues (Apology, Phaedo, Crito)",
        "Xenophon's accounts"
      ]
    }
  ]
}
```

## Technical Implementation Hints

### File to Create

`content/timeline/philosophical-timeline.json`

### Event Selection Criteria

**Must Include (High Priority Events):**

**Ancient Foundations (600 BCE - 0):**
1. c. 563 BCE - Birth of Buddha
2. c. 531 BCE - Buddha's Great Renunciation (leaves palace)
3. c. 528 BCE - Buddha's Enlightenment under Bodhi tree
4. c. 571 BCE - Birth of Laozi (legendary, disputed date)
5. 399 BCE - Death of Socrates
6. c. 369 BCE - Birth of Diogenes the Cynic
7. c. 341 BCE - Diogenes meets Alexander the Great
8. 55 CE - Epictetus born into slavery
9. c. 4 BCE - Birth of Seneca

**Classical & Medieval (1 - 1400 CE):**
10. 65 CE - Death of Seneca (forced suicide)
11. 121 CE - Birth of Marcus Aurelius
12. c. 170-180 CE - Marcus writes Meditations during Marcomannic Wars
13. 180 CE - Death of Marcus Aurelius
14. c. 788-820 CE - Life of Adi Shankaracharya (Advaita Vedanta)
15. 1207 CE - Birth of Rumi
16. 1244 CE - Rumi meets Shams Tabrizi (transformative encounter)
17. 1273 CE - Death of Rumi

**Renaissance & Reform (1400 - 1800):**
18. 1479 CE - Birth of Vallabhacharya
19. 1017 CE - Birth of Ramanujacharya
20. 1238 CE - Birth of Madhvacharya

**Modern & Contemporary (1800 - 2000):**
21. 1863 - Birth of Swami Vivekananda
22. 1893 - Vivekananda's speech at Parliament of World Religions (Chicago)
23. 1879 - Birth of Ramana Maharshi
24. 1895 - Birth of Jiddu Krishnamurti
25. 1929 - Krishnamurti dissolves Order of the Star (rejects messiah role)
26. 1950 - Death of Ramana Maharshi

### Event Description Guidelines (150-250 words)

**Structure:**
1. **What happened** (2-3 sentences): Core facts
2. **Context** (2-3 sentences): Why/how it happened
3. **Immediate impact** (1-2 sentences): Direct consequences
4. **Lasting significance** (1-2 sentences): Why it matters

**Tone:**
- Narrative, engaging
- Vivid details where available
- Humanize historical figures
- Show drama and significance

### Modern Parallels - Creative Examples

**Ancient → Modern Connections:**
- **Buddha leaving palace** → Tech billionaire leaving corporate world for meaning (e.g., early retirees seeking purpose)
- **Socrates's trial** → Academic freedom debates, cancellation, political prosecution of dissidents
- **Diogenes in barrel** → Tiny house movement, minimalism, anti-consumerism
- **Marcus writing Meditations in war tent** → Leaders journaling during crisis (Churchill, Lincoln)
- **Epictetus teaching as former slave** → Formerly incarcerated individuals becoming educators/activists
- **Rumi meeting Shams** → Transformative mentorship (Jobs-Kobun Chino, Oprah-Maya Angelou)
- **Vivekananda at Parliament** → TED talks bringing Eastern wisdom to Western audience
- **Krishnamurti dissolving Order** → Public figures rejecting platforms/fame (Dave Chappelle leaving show)

### Geographic Diversity

Ensure events span:
- **South Asia:** India (Vedanta), Nepal (Buddhism)
- **East Asia:** China (Taoism)
- **Middle East:** Persia, Turkey (Sufism)
- **Mediterranean:** Greece, Rome (Stoicism, Cynicism)
- **Modern:** America, Europe (Neo-Vedanta, modern teachers)

### Event Types Distribution

- **Births:** 10+ (major figures entering world)
- **Deaths:** 8+ (especially dramatic or significant - Socrates, Seneca, etc.)
- **Works Created:** 12+ (Meditations written, Upanishads composed, Tao Te Ching, etc.)
- **Teaching Events:** 8+ (Buddha's first sermon, Epictetus's school, Vivekananda's Chicago speech)
- **Historical Milestones:** 7+ (Alexander meets Diogenes, philosopher exiles, etc.)

## Definition of Done

- [ ] 45+ timeline events documented
- [ ] Events span 600 BCE to 2000 CE (2,600+ years)
- [ ] All 7 traditions represented
- [ ] All 5 event types included with minimum counts
- [ ] Each event 150-250 words
- [ ] All 11 required fields populated
- [ ] BCE dates as negative numbers in JSON, display as "BCE"
- [ ] Modern parallels for each event
- [ ] Geographic diversity across events
- [ ] Historical accuracy verified with sources
- [ ] JSON validates against schema
- [ ] File saved at `content/timeline/philosophical-timeline.json`
- [ ] Chronological ordering (earliest to latest)
- [ ] Approximate dates marked with "c." in display
- [ ] Sources cited for each event

## Research Sources

### Primary Sources
- Ancient texts (where events described)
- Historical records

### Secondary Sources
- Stanford Encyclopedia of Philosophy
- Oxford Classical Dictionary
- Academic biographies
- Scholarly timelines

### Date Verification
- Cross-reference multiple academic sources
- Note discrepancies where dates disputed
- Use scholarly consensus where available

---

**Labels:** `content`, `copilot-ready`, `timeline`, `research`, `parallel-safe`
