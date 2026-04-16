# Presentation skills

Portable skill set for creating presentations from input, turning plans into decks, and reviewing decks for story quality.

---

## Skills in this repository

| Path | Purpose |
|------|---------|
| `skills/brief-to-presentation-plan/SKILL.md` | Turn a brief, notes, transcript, or doc into a presentation plan |
| `skills/presentation-plan-to-deck/SKILL.md` | Turn an approved plan into an actual deck with layout and reveal logic |
| `skills/presentation-plan-to-deck/references/html-slide-deck.md` | Optional mechanics for a single-file HTML deck |
| `skills/deck-review-update/SKILL.md` | Review an existing deck for story, pacing, and concrete improvements |
| `scripts/install-all.sh` | Install all skills for one platform in one command |

This repo now uses a shared `skills/` directory, similar to the Superpowers layout, so you can install the whole collection at once.

```bash
REPO="/absolute/path/to/this-repo"
```

Recommended workflow:

1. `brief-to-presentation-plan`
2. `presentation-plan-to-deck`
3. `deck-review-update`

---

## Quick install

Run one command from the repo root:

```bash
./scripts/install-all.sh cursor
./scripts/install-all.sh claude
./scripts/install-all.sh codex
```

Defaults:

- `cursor` -> `~/.cursor/skills`
- `claude` -> `~/.claude/skills`
- `codex` -> `~/.agents/skills/presentation-skills`

You can override the destination by passing a second argument.

---

## Install: `.cursor/skills/` layout

Some products discover skills at `<workspace>/.cursor/skills/<skill-id>/SKILL.md` or under a user-level `~/.cursor/skills/` directory.

One-command install:

```bash
./scripts/install-all.sh cursor
```

Manual equivalent:

```bash
DEST="/path/to/workspace/.cursor/skills"
mkdir -p "$DEST"
for skill in "$REPO"/skills/*; do
  ln -sfn "$skill" "$DEST/$(basename "$skill")"
done
```

Use only **user- or project-owned** `skills` directories. Do not overwrite vendor-managed skill bundles that ship with a product.

---

## Install: Claude Code (`.claude/skills/`)

Claude Code expects **`.claude/skills/<skill-id>/SKILL.md`** at the project root (or the equivalent user config location).

One-command install:

```bash
./scripts/install-all.sh claude
```

Manual project install:

```bash
PROJ="/path/to/your/project"
mkdir -p "$PROJ/.claude/skills"
for skill in "$REPO"/skills/*; do
  ln -sfn "$skill" "$PROJ/.claude/skills/$(basename "$skill")"
done
```

User-wide:

```bash
./scripts/install-all.sh claude ~/.claude/skills
```

Restart or rescan skills so the new skills are picked up.

---

## Install: Codex and other agents (`AGENTS.md` / instructions)

Codex can use the same “all skills in one collection” pattern as Superpowers.

One-command install:

```bash
./scripts/install-all.sh codex
```

This creates one symlink:

```text
~/.agents/skills/presentation-skills -> <repo>/skills
```

Detailed Codex instructions: [`.codex/INSTALL.md`](.codex/INSTALL.md)

If you prefer path-based project instructions instead, reference the skill by path:

```markdown
## Presentations

When the user provides a brief, notes, transcript, or document and wants a presentation plan, read and follow:

`/absolute/path/to/this-repo/skills/brief-to-presentation-plan/SKILL.md`
```

Then, when an approved presentation plan needs to become a deck, use:

`/absolute/path/to/this-repo/skills/presentation-plan-to-deck/SKILL.md`

When reviewing or improving an existing deck, use:

`/absolute/path/to/this-repo/skills/deck-review-update/SKILL.md`

Add `skills/presentation-plan-to-deck/references/html-slide-deck.md` only when working on a single-file HTML deck.

---

## Open this repo with a skills bridge

If your environment only loads skills from `.cursor/skills/` inside the workspace:

```bash
cd "$REPO"
mkdir -p .cursor/skills
for skill in "$PWD"/skills/*; do
  ln -sfn "$skill" ".cursor/skills/$(basename "$skill")"
done
```

Keep that symlink local unless your team wants it committed.

---

## Updating

Pull or edit this repository. Symlinks track updates; copies need a fresh `cp -R`.
