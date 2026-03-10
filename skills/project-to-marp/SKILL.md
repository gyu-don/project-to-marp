---
name: project-to-marp
description: Create a Marp presentation (markdown slides) introducing a project. Use when the user wants to make a presentation or slides about their project, codebase, or work. Triggers on requests like "make slides for this project", "create a presentation", "プレゼンを作って", "スライドを作りたい".
---

# Project to Marp

Create a Marp presentation introducing the current project with minimal user effort.

## Workflow

### 1. Read Context

Before asking anything, check the current conversation for clues about the user's intent — what they want to communicate, to whom, or any constraints already mentioned.

### 2. Explore the Project

Quickly survey the project to understand what it does:
- README, docs
- Directory structure and key source files
- Any existing documentation or descriptions

### 3. Clarify (Keep It Short)

Only ask what cannot be reasonably inferred. Ask all questions in a single message.

**Ask using AskUserQuestion (multiple choice) when options are clear:**
- Presentation length: "5 min (5–7 slides) / 10 min (10–12 slides) / 15 min (15–18 slides)"
- Audience: "Developers / Non-technical stakeholders / Mixed / Other"

**Ask as freeform if choices would be burdensome:**
- Purpose / key message: "What's the one thing you most want the audience to take away? (Don't worry about organizing — just write whatever comes to mind)"

If both audience and purpose can be inferred from context, skip asking entirely.

### 4. Create the Presentation

Generate a `.md` file (e.g. `presentation.md`) in the project root.

**Structure:**
1. Title slide — project name + one-line description
2. Problem / Background — why this project exists
3. Solution / Overview — what it does
4. Key Features — 2–4 highlights, one idea per slide
5. Architecture / How It Works — diagram or bullet overview (if technical audience)
6. Demo / Usage — example commands, screenshots, or code snippets
7. Summary + Next Steps / Call to Action

Adjust sections based on audience and purpose. Non-technical audiences: skip or simplify architecture.

**Writing style:**
- One idea per slide
- Bullet points: max 5–6 per slide, each ≤ 15 words
- Title slides and section dividers: use `<!-- _class: lead -->`

For Marp syntax, see [references/marp-syntax.md](references/marp-syntax.md).

### 5. PDF Export and Layout Check (if Marp is installed)

Check if Marp CLI is available:
```bash
marp --version
```

If available:
1. Export to PDF: `marp --pdf --allow-local-files presentation.md -o presentation.pdf`
2. Open or inspect the PDF to check for text overflow or layout issues
3. If any slide has clipped or overflowing text, shorten the content and re-export

If Marp is not installed, inform the user and suggest: `npm install -g @marp-team/marp-cli`
