# Presentation skills for Codex

## Quick install

From the cloned repository root:

```bash
./scripts/install-all.sh codex
```

This creates:

```text
~/.agents/skills/presentation-skills -> <repo>/skills
```

Restart Codex after installing so it rescans skills.

## Manual install

```bash
mkdir -p ~/.agents/skills
ln -sfn /absolute/path/to/this-repo/skills ~/.agents/skills/presentation-skills
```

## Verify

```bash
ls ~/.agents/skills/presentation-skills
```

You should see:

- `brief-to-presentation-plan`
- `presentation-plan-to-deck`
- `deck-review-update`
