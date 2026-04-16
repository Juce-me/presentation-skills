# Presentation planning — agent skill

Portable **presentation-planning** skill: decide theme, audience, story structure, and pacing **before** you build slides or speaker notes.

---

## Layout in this repository

| Path | Purpose |
|------|---------|
| `presentation-planning/SKILL.md` | Main skill (frame → outline → build) |
| `presentation-planning/references/html-slide-deck.md` | Optional mechanics for a single-file HTML deck (patterns + examples to replace) |

Install by copying or symlinking the **`presentation-planning`** folder wherever your tooling expects a skill directory.

```bash
REPO="/absolute/path/to/this-repo"
SKILL="$REPO/presentation-planning"
```

---

## Install: `.cursor/skills/` layout

Some products discover skills at `<workspace>/.cursor/skills/<skill-id>/SKILL.md` or under a user-level `~/.cursor/skills/` directory.

```bash
DEST="/path/to/workspace/.cursor/skills"
mkdir -p "$DEST"
ln -s "$SKILL" "$DEST/presentation-planning"
# or: cp -R "$SKILL" "$DEST/presentation-planning"
```

Use only **user- or project-owned** `skills` directories. Do not overwrite vendor-managed skill bundles that ship with a product.

---

## Install: Claude Code (`.claude/skills/`)

Claude Code expects **`.claude/skills/<skill-id>/SKILL.md`** at the project root (or the equivalent user config location).

```bash
PROJ="/path/to/your/project"
mkdir -p "$PROJ/.claude/skills"
ln -s "$SKILL" "$PROJ/.claude/skills/presentation-planning"
```

User-wide (if your setup supports it):

```bash
mkdir -p ~/.claude/skills
ln -s "$SKILL" ~/.claude/skills/presentation-planning
```

Restart or rescan skills so **presentation-planning** is picked up.

---

## Install: Codex and other agents (`AGENTS.md` / instructions)

Reference the skill by path in project instructions.

```markdown
## Presentations

When the user plans or writes a presentation, slide deck, or talk outline, read and follow:

`/absolute/path/to/this-repo/presentation-planning/SKILL.md`
```

Add a second path to `references/html-slide-deck.md` only when working on a single-file HTML deck in that project.

---

## Open this repo with a skills bridge

If your environment only loads skills from `.cursor/skills/` inside the workspace:

```bash
cd "$REPO"
mkdir -p .cursor/skills
ln -sf "$PWD/presentation-planning" .cursor/skills/presentation-planning
```

Keep that symlink local unless your team wants it committed.

---

## Updating

Pull or edit this repository. Symlinks track updates; copies need a fresh `cp -R`.
