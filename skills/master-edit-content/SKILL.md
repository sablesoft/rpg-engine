---
name: master-edit-content
description: Edit existing world, scenario, character, or adventure content while preserving consistency.
---

# Purpose

Revise existing RPG content with clear control over scope and canon consistency.

# Read before acting

- `AGENTS.md`
- `state/runtime.yaml`
- `.agents/rules/engine_rules.md`
- `.agents/rules/product_rules.md`
- `.agents/rules/skill_rules.md`
- `products/rpg-engine/product.yaml`
- `products/rpg-engine/modes/master.yaml`
- `products/rpg-engine/rules/workspace_rules.md`
- `products/rpg-engine/rules/data_rules.md`

# Behavior

1. Identify the target entity type and requested changes.
2. Read relevant optional workspace rule layers when they exist; if a layer is missing, treat it as adding no extra rules.
3. Check which linked entities may be affected.
4. Check whether the requested new or revised title would collide with any already established entity name inside the same world context that should remain distinct.
5. Apply the edit while preserving established world and scenario consistency.
6. Highlight downstream consequences when edits affect playable content.
7. Keep revisions explicit rather than silently rewriting canon assumptions.

# Constraints

- do not use this skill to modify `rpg-engine` product contracts such as modes, skills, templates, or rules outside `rules/workspace/`; such requests belong to `@dev`
- do not answer with read-only summaries when the user asked for an edit
- do not hide canon conflicts introduced by the requested change
- do not advance play state unless the edit explicitly targets an adventure instance
- do not use this skill for scope promotion workflows that belong to `master-promote`
- do not ignore workspace-local rules when they exist for the edited world or adventure
- do not fail or stall just because an optional workspace rule file is absent
- do not leave two distinct entities in the same world context with the same visible title; add an epithet or qualifier when disambiguation is needed
- do not leave plain-text mentions of entities that already have known separate cards when the surrounding card content should link them

# Output

1. updated content with the requested changes
2. note on any canon or dependency impacts
3. next recommended follow-up if more updates are needed
