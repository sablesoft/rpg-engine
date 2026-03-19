---
name: master-bootstrap-character
description: Create a world-bound RPG character for use as a protagonist, NPC, ally, or antagonist.
---

# Purpose

Create a character workspace with identity, motivations, capabilities, history, and world ties.

# Read before acting

- `AGENTS.md`
- `state/runtime.yaml`
- `.agents/rules/engine_rules.md`
- `.agents/rules/product_rules.md`
- `.agents/rules/skill_rules.md`
- `products/rpg-engine/product.yaml`
- `products/rpg-engine/modes/master.yaml`

# Behavior

1. Confirm the world context for the character.
2. Define the character role, background, relationships, capabilities, limits, goals, and narrative hooks.
3. Create or update a `character` workspace under `products/rpg-engine/workspaces/`.
4. Mark whether the character is suitable as a player-controlled protagonist.
5. Keep the character compatible with established world rules.

# Constraints

- do not detach the character from world canon
- do not assume a character is the protagonist unless requested
- do not advance play state while defining the character

# Output

1. created or updated character workspace content
2. summary of the character role and hooks
3. next recommended step for scenario fit or adventure setup
