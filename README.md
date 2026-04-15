# cursor-skills-presentation

Repository for the **presentation-authoring** skill: define theme, audience, narrative arc, and composition *before* you build slides or speaker notes. Optional reference covers the OKR–Jira single-file HTML deck pattern.

---

## What’s in this repo

| Path | Purpose |
|------|---------|
| `.cursor/skills/presentation-authoring/SKILL.md` | Main skill (strategy-first workflow) |
| `.cursor/skills/presentation-authoring/references/okr-html-slide-deck.md` | HTML deck tokens, `.rv`/`.step`, components, checklist |

The canonical copy of the skill lives under **`.cursor/skills/`** so Cursor picks it up when this folder is opened or when you symlink that path into another project.

---

## Cursor

**Project-only (this repo)**  
Open the repo in Cursor; skills under `.cursor/skills/` are loaded for this workspace.

**Another project** — copy or symlink the skill folder:

```bash
REPO="$HOME/Documents/cursor-skills-presentation"   # adjust if yours differs
DEST="/path/to/your/project/.cursor/skills"
mkdir -p "$DEST"
ln -s "$REPO/.cursor/skills/presentation-authoring" "$DEST/presentation-authoring"
# or: cp -R "$REPO/.cursor/skills/presentation-authoring" "$DEST/"
```

**All Cursor workspaces (user skills)**

```bash
mkdir -p ~/.cursor/skills
ln -s "$HOME/Documents/cursor-skills-presentation/.cursor/skills/presentation-authoring" \
  ~/.cursor/skills/presentation-authoring
```

Do not install under `~/.cursor/skills-cursor/` — that tree is reserved for Cursor’s built-ins.

---

## Claude Code

Claude Code loads skills from **`.claude/skills/<skill-name>/SKILL.md`** (project root) or from your user config directory (same layout). This repo uses the same `SKILL.md` + `references/` layout Cursor expects.

**Symlink into a project** (keeps this repo as source of truth):

```bash
REPO="$HOME/Documents/cursor-skills-presentation"
PROJ="/path/to/your/project"
mkdir -p "$PROJ/.claude/skills"
ln -s "$REPO/.cursor/skills/presentation-authoring" "$PROJ/.claude/skills/presentation-authoring"
```

**User-wide (all projects using that machine’s Claude Code config)**

```bash
# Typical user skills location; if your install differs, mirror the same folder shape.
mkdir -p ~/.claude/skills
ln -s "$HOME/Documents/cursor-skills-presentation/.cursor/skills/presentation-authoring" \
  ~/.claude/skills/presentation-authoring
```

After linking, restart the Claude Code session or rescan skills so **`presentation-authoring`** appears in skill discovery.

---

## Codex (OpenAI)

Codex does not use the same `.cursor/skills/` discovery path. Use **project instructions** so the agent loads this content when relevant.

**Option A — `AGENTS.md` in the repo where you use Codex**

Add (or merge) something like:

```markdown
## Presentation work

When the user plans or writes a presentation, slide deck, or talk outline, read and follow the instructions in:

`../cursor-skills-presentation/.cursor/skills/presentation-authoring/SKILL.md`

For the OKR–Jira HTML single-file deck, also read:

`../cursor-skills-presentation/.cursor/skills/presentation-authoring/references/okr-html-slide-deck.md`

(Adjust the relative path so it resolves from that project’s root.)
```

**Option B — copy the skill into the Codex project**

```bash
cp -R "$HOME/Documents/cursor-skills-presentation/.cursor/skills/presentation-authoring" \
  /path/to/codex-project/docs/presentation-authoring
```

Then point `AGENTS.md` at `docs/presentation-authoring/SKILL.md`.

**Option C — global Codex instructions**  
If your Codex CLI or IDE integration supports a global instructions file, paste the same “read this path when…” rule there, using an absolute path to this repo’s `SKILL.md`.

---

## Updating

Pull or edit this repo, then refresh symlinks (they keep pointing at the updated files). If you copied instead of symlinked, re-run `cp -R`.

---

## Related: OKR HTML deck

The deck that motivated the reference doc usually lives in a separate clone (for example `~/Documents/okrs`). Keep that repo’s **`CLAUDE.md`** as the full technical spec for `okr-jira-planning.html`; this repo holds the reusable skill and a short implementation cheat sheet.
