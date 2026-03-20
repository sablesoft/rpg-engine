---
name: master-bootstrap-character
description: Create a world-bound RPG character for use as a protagonist, NPC, ally, or antagonist.
---

# Purpose

Create a world-owned character card with identity, motivations, capabilities, history, and world ties.

# Read before acting

- `AGENTS.md`
- `state/runtime.yaml`
- `.agents/rules/engine_rules.md`
- `.agents/rules/product_rules.md`
- `.agents/rules/skill_rules.md`
- `products/rpg-engine/product.yaml`
- `products/rpg-engine/modes/master.yaml`
- `products/rpg-engine/rules/data_rules.md`
- `products/rpg-engine/assets/workspace_dictionary/`
- `products/rpg-engine/assets/workspace_templates/character_structure.md`
- `products/rpg-engine/skills/master-bootstrap-character/assets/character_card_template.md`
- `products/rpg-engine/skills/master-bootstrap-character/assets/character_option_template.md`

# Behavior

1. Confirm the world context for the character and locate the owning world repository.
2. Define the character role, background, relationships, capabilities, limits, goals, and narrative hooks.
3. Ensure the character title and any newly introduced named entities are distinct from other established entity names inside that same world context unless the same entity is intentionally being revised.
4. Create or update a world-owned character card following `products/rpg-engine/assets/workspace_templates/character_structure.md` and using:
   - `products/rpg-engine/workspace/world/<world_slug>/characters/<character_slug>.md`
   - the character card template as the primary content artifact
5. Mark whether the character is suitable as a player-controlled protagonist.
6. Keep the character compatible with established world rules.

# Constraints

- do not detach the character from world canon
- do not assume a character is the protagonist unless requested
- do not advance play state while defining the character
- do not introduce a character title that duplicates another established entity title inside the same world context; add an epithet or qualifier instead
- when a created or updated mention points to an existing separate card with a known path, write it as a Markdown link

# Output

1. created or updated character content inside the world repository
2. concise description of the character role and hooks
3. next recommended step for scenario fit or adventure setup
