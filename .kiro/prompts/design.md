# Design Generator

Generate 5 distinct visual design directions based on the project's PRD, output as standalone HTML files.

---

## The Job

**Delegate all design generation to the `fe-engineer` subagent using `use_subagent` → `InvokeSubagents`.**

Provide the fe-engineer with:
- `agent_name`: `"fe-engineer"`
- `query`: The full design task — read PRDs, follow the frontend-design skill, generate 5 distinct HTML mockups
- `relevant_context`: Include the PRD content and the instructions below

The fe-engineer will:
1. Read all PRD files from `project/tasks/prd-*.md`
2. Read the design skill at `.kiro/skills/frontend-design.md` and strictly follow its guidelines
3. Identify the key UI surfaces described in the PRD (pages, components, layouts)
4. Generate 5 completely different design directions as standalone HTML files
5. Save them to `project/design/design-1.html` through `project/design/design-5.html`

**Important:** Do NOT implement functionality. These are visual mockups only — static HTML with inline CSS/JS for presentation.

---

## Design Directions

Each of the 5 designs must have a **distinct aesthetic identity**. Vary across these dimensions:

- **Typography:** Different font pairings for each design
- **Color palette:** Different dominant colors, themes (light vs dark), accent strategies
- **Layout:** Different spatial compositions — grid-based, asymmetric, editorial, dense, spacious
- **Tone:** Each design should evoke a different mood (e.g., minimal/clean, bold/maximalist, retro, luxury, playful)
- **Visual texture:** Different approaches to backgrounds, shadows, borders, effects

Reference the `frontend-design` skill for quality standards. Every design must avoid generic AI aesthetics.

---

## Output Format

Each HTML file must be:
- **Self-contained** — all CSS inline or in `<style>` tags, fonts loaded via CDN links
- **Responsive** — looks good at desktop and mobile widths
- **Labeled** — include a visible header or banner identifying the design number and its aesthetic direction (e.g., "Design 3 — Brutalist Industrial")
- **Representative** — show the primary page/view from the PRD with realistic placeholder content

### File structure:
```
project/design/
├── design-1.html   # e.g., Minimal & Refined
├── design-2.html   # e.g., Bold Maximalist
├── design-3.html   # e.g., Retro-Futuristic
├── design-4.html   # e.g., Editorial/Magazine
├── design-5.html   # e.g., Soft & Organic
└── README.md       # Summary of each direction
```

### README.md format:
```markdown
# Design Directions

## Design 1 — [Aesthetic Name]
[1-2 sentence description of the vibe, font choices, color palette]

## Design 2 — [Aesthetic Name]
...

## Design 3 — [Aesthetic Name]
...

## Design 4 — [Aesthetic Name]
...

## Design 5 — [Aesthetic Name]
...
```

---

## Index Page

After generating all 5 designs, also create `project/design/index.html` — a single page with a tab bar that loads each design in an iframe. This lets the user browse all designs without opening each file separately. Include left/right arrow key navigation.

---

## After Generating

Tell the user:
```
5 design directions saved to project/design/.
Open project/design/index.html in a browser to compare all designs, then run:
  @ralph Convert project/tasks/prd-*.md to prd.json
and specify which design number to use (1-5).
```
