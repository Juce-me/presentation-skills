#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Install all presentation skills for one platform.

Usage:
  scripts/install-all.sh cursor [DEST]
  scripts/install-all.sh claude [DEST]
  scripts/install-all.sh codex  [DEST]

Defaults:
  cursor -> ~/.cursor/skills
  claude -> ~/.claude/skills
  codex  -> ~/.agents/skills/presentation-skills
EOF
}

if [[ "${1:-}" == "" || "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

platform="$1"
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
skills_root="$repo_root/skills"

link_skill_dirs() {
  local dest_root="$1"
  mkdir -p "$dest_root"

  for skill_dir in "$skills_root"/*; do
    local skill_name
    skill_name="$(basename "$skill_dir")"
    ln -sfn "$skill_dir" "$dest_root/$skill_name"
    echo "linked $skill_name -> $dest_root/$skill_name"
  done
}

case "$platform" in
  cursor)
    dest="${2:-$HOME/.cursor/skills}"
    link_skill_dirs "$dest"
    echo "Installed all skills for Cursor at $dest"
    ;;
  claude)
    dest="${2:-$HOME/.claude/skills}"
    link_skill_dirs "$dest"
    echo "Installed all skills for Claude Code at $dest"
    ;;
  codex)
    dest="${2:-$HOME/.agents/skills/presentation-skills}"
    mkdir -p "$(dirname "$dest")"
    ln -sfn "$skills_root" "$dest"
    echo "Linked skills collection for Codex at $dest"
    ;;
  *)
    echo "Unknown platform: $platform" >&2
    usage >&2
    exit 1
    ;;
esac
