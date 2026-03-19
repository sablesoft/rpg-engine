---
name: master-bootstrap-world
description: Create a new RPG world with canon foundations, setting rules, and high-level structure.
---

# Purpose

Create a world workspace that defines canon, lore, physics, factions, history, and tone.

# Read before acting

- `AGENTS.md`
- `state/runtime.yaml`
- `.agents/rules/engine_rules.md`
- `.agents/rules/product_rules.md`
- `.agents/rules/skill_rules.md`
- `products/rpg-engine/product.yaml`
- `products/rpg-engine/modes/master.yaml`
- `products/rpg-engine/assets/workspace_templates/world_structure.md`
- `products/rpg-engine/skills/master-bootstrap-world/assets/world_card_template.md`
- `products/rpg-engine/skills/master-bootstrap-world/assets/setting_template.md`
- `products/rpg-engine/skills/master-bootstrap-world/assets/rules_of_world_template.md`
- `products/rpg-engine/skills/master-bootstrap-world/assets/tone_and_theme_template.md`
- `products/rpg-engine/skills/master-bootstrap-world/assets/location_card_template.md`
- `products/rpg-engine/skills/master-bootstrap-world/assets/faction_card_template.md`
- `products/rpg-engine/skills/master-bootstrap-world/assets/species_card_template.md`

# Behavior

1. Confirm the request belongs to `rpg-engine` and the `master` mode.
2. Define the world identity, genre, tone, physical rules, power systems, major factions, history, and open tensions.
3. Create or update a `world` workspace under `products/rpg-engine/workspaces/` following `products/rpg-engine/assets/workspace_templates/world_structure.md` and using:
   - `products/rpg-engine/workspaces/world/<slug>/world.md`
   - `world.md` as the primary card
   - `products/rpg-engine/workspaces/world/<slug>/setting.md`
   - `products/rpg-engine/workspaces/world/<slug>/rules_of_world.md`
   - `products/rpg-engine/workspaces/world/<slug>/tone_and_themes.md`
   - optional support files such as `setting.md`, `rules_of_world.md`, and `tone_and_themes.md`
   - `products/rpg-engine/workspaces/world/<slug>/locations/<slug>.md`
   - `products/rpg-engine/workspaces/world/<slug>/factions/<slug>.md`
   - `products/rpg-engine/workspaces/world/<slug>/species/<slug>.md`
   - optional support-card folders such as `locations/`, `factions/`, and `species/`
4. Keep the world contract internally consistent and usable by scenarios, characters, and adventures.
5. Surface missing inputs only when they block coherent world creation.

# Constraints

- do not advance live adventure state
- do not use read-only reference mode for creation work
- keep canon distinct from scenario-specific events
- keep all engine-side instructions in English

# Output

1. created or updated world workspace content
2. summary of the world foundations
3. next recommended step for scenario or character work
