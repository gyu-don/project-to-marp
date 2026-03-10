---
name: project-to-marp
description: Create a Marp presentation (markdown slides) introducing a project. Use when the user wants to make a presentation or slides about their project, codebase, or work. Triggers on requests like "make slides for this project", "create a presentation", "プレゼンを作って", "スライドを作りたい".
allowed-tools: Read, Grep, Write, Edit, Bash(marp *)
---

# Project to Marp

Create a Marp presentation introducing the current project with minimal user effort.

## Language

Write the presentation in the same language as the user's request/conversation, unless the user specifies otherwise.

## Workflow

### 1. Read Context

Before anything else, check the current conversation for clues about the user's intent — what they want to communicate, to whom, or any constraints already mentioned.

### 2. Quick Survey

Do a lightweight survey — just enough to ask informed questions:
- README, package.json / pyproject.toml / equivalent
- Top-level directory structure

### 3. Clarify (Keep It Short)

Only ask what cannot be reasonably inferred. Ask all questions in a single message.

**Ask using AskUserQuestion (multiple choice) when options are clear:**
- Presentation length: "5 min (5–7 slides) / 10 min (10–12 slides) / 15 min (15–18 slides)"
- Audience: "Developers / Non-technical stakeholders / Mixed / Other"

**Always ask about purpose / key message — choose the form based on how much you can infer:**
- If the user's intent feels sufficiently clear from context, propose your inferred message as options using AskUserQuestion (e.g. "Does this capture what you want to convey? / Something else")
- If intent is unclear or thin, make your best guess as a suggestion and ask as freeform: "I'm thinking something like '…' — what's the one thing you most want the audience to take away? (Don't worry about organizing — just write whatever comes to mind)"

The audience question can be skipped if clearly inferable.

### 4. Deep Exploration

After receiving the user's answers, thoroughly explore the project to understand it well:
- Key source files, core logic, architecture
- Docs, comments, examples
- Any unique or interesting aspects worth highlighting

Take time here — a well-understood project leads to a much better presentation.

### 5. Design Two Storylines

Based on the user's answers and your deep exploration, design **two distinct storyline proposals** — think of them as two different angles or narratives for the same project. Each proposal should have a different structure, emphasis, or rhetorical flow. For example:

- **Proposal A**: Problem-first — open with the pain point, then reveal the solution
- **Proposal B**: Vision-first — open with the end result or impact, then explain how

Other possible contrasts: technical depth vs. business value, chronological story vs. feature-driven, demo-first vs. theory-first. Choose contrasts that make sense for the project and audience.

Do **not** ask the user to choose — generate slides for both.

### 6. Create Both Presentations

Generate **two** `.md` files in the project root:
- `presentation-a.md` — Proposal A
- `presentation-b.md` — Proposal B

**Structure per proposal** (adjust based on storyline angle):
1. Title slide — project name + one-line description
2. Problem / Background — why this project exists
3. Solution / Overview — what it does
4. Key Features — 2–4 highlights, one idea per slide
5. Architecture / How It Works — diagram or bullet overview (if technical audience)
6. Demo / Usage — example commands, screenshots, or code snippets
7. Summary + Next Steps / Call to Action

**Writing style:**
- One idea per slide
- Bullet points: max 5–6 per slide, each ≤ 15 words
- Title slides and section dividers: use `<!-- _class: lead -->`
- Keep content concise to avoid text overflow — when in doubt, cut rather than squeeze

For Marp syntax, see [references/marp-syntax.md](references/marp-syntax.md).

### 7. Export (if Marp is installed)

Check if Marp CLI is available:
```bash
marp --version
```

If available, export both presentations to HTML:
```bash
marp --allow-local-files presentation-a.md -o presentation-a.html
marp --allow-local-files presentation-b.md -o presentation-b.html
```

If Marp is not installed, inform the user and suggest: `npm install -g @marp-team/marp-cli`

### 8. Explain Both Proposals

After generating both presentations, explain them to the user in a single message:

- **Proposal A** (`presentation-a.md`): describe its storyline angle, opening hook, and what kind of audience or occasion it suits best
- **Proposal B** (`presentation-b.md`): same breakdown
- Briefly note the key difference between the two, and let the user know they can use either as-is, ask for revisions, or merge elements from both
