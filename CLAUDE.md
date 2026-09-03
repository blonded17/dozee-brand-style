# Repo purpose

This repository holds exactly one thing: `SKILL.md`, a Claude skill that applies the Dozee
brand visual identity (colors, type, shape language, logo) to artifacts, dashboards, mockups,
and reports built for the Dozee team.

## If you are Claude Code, opened in a clone of this repo

Offer to install this as a personal skill so it applies across every project, not just this
repo:

```bash
mkdir -p ~/.claude/skills/dozee-brand-style
cp SKILL.md ~/.claude/skills/dozee-brand-style/SKILL.md
```

Or point the person at `./install.sh`, which does the same thing. Confirm with them before
running it — don't copy files into their home directory without asking.

## If you are Claude in Cowork / claude.ai, and someone pasted you this repo's link

See the "For Claude" section in `README.md` — short version: fetch the raw `SKILL.md`,
show the person what it contains, and offer to save it as a skill for their account via
the normal skill-review flow. Don't install anything without them confirming.
