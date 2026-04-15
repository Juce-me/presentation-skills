# cursor-skills-presentation

Standalone repository for the **presentation-authoring** Cursor skill: framing theme, audience, narrative arc, and composition before you build slides or speaker notes.

## Contents

| Path | Purpose |
|------|---------|
| `.cursor/skills/presentation-authoring/SKILL.md` | Main skill (strategy-first workflow) |
| `.cursor/skills/presentation-authoring/references/okr-html-slide-deck.md` | Optional add-on for the OKR–Jira single-file HTML deck (`okr-jira-planning.html`) |

## Use in another project

**Option A — copy the skill folder**

```bash
cp -R .cursor/skills/presentation-authoring /path/to/your/project/.cursor/skills/
```

**Option B — symlink (keep this repo as the source of truth)**

```bash
mkdir -p /path/to/your/project/.cursor/skills
ln -s /Users/a.feygin/Documents/cursor-skills-presentation/.cursor/skills/presentation-authoring \
  /path/to/your/project/.cursor/skills/presentation-authoring
```

**Option C — personal skills** (all Cursor projects)

Copy or symlink into `~/.cursor/skills/presentation-authoring` instead.

## Related project

The OKR–Jira HTML deck that motivated the reference doc lives in a separate repo (e.g. `Documents/okrs`). Keep **`CLAUDE.md`** there as the full technical spec for that file; this repo holds the reusable skill and a short implementation cheat sheet.
