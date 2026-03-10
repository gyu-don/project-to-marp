# project-to-marp

A Claude Code plugin that generates [Marp](https://marp.app/) presentations from your project with minimal effort.

## What It Does

Invoke the skill and Claude will:

1. Explore your project (README, structure, key files)
2. Ask a few focused questions (length, audience, key message)
3. Generate a polished Marp markdown presentation
4. If Marp CLI is installed, export to PDF and check for layout issues

## Installation

### From Marketplace (Recommended)

```
/plugin marketplace add gyu-don/project-to-marp
/plugin install project-to-marp@project-to-marp
```

### From Local Directory

```bash
git clone https://github.com/gyu-don/project-to-marp.git
```

```
/plugin marketplace add ./project-to-marp
/plugin install project-to-marp@project-to-marp
```

### For Development

```bash
claude --plugin-dir ./project-to-marp
```

## Usage

In any project directory, invoke the skill:

```
/project-to-marp:project-to-marp
```

Claude will explore the project and guide you through a short Q&A to produce a presentation tailored to your audience and goals.

## Requirements

- [Claude Code](https://code.claude.com/docs) v1.0.33 or later
- [Marp CLI](https://github.com/marp-team/marp-cli) (optional, for PDF export): `npm install -g @marp-team/marp-cli`
- A browser (Chrome/Chromium/Firefox) for PDF export

## What's Included

```
project-to-marp/
├── .claude-plugin/
│   ├── plugin.json           # Plugin manifest
│   └── marketplace.json      # Marketplace catalog
└── skills/
    └── project-to-marp/
        ├── SKILL.md          # Skill instructions
        └── references/
            └── marp-syntax.md  # Marp syntax reference
```

## License

MIT
