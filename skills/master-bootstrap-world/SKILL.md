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
- `products/rpg-engine/assets/workspace_dictionary/`
- `products/rpg-engine/assets/workspace_templates/world_structure.md`
- `products/rpg-engine/assets/workspace_templates/world_rules_template.md`
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
   - optional `products/rpg-engine/workspaces/world/<slug>/rules/world_rules.md` when this world needs explicit workspace-local invariants
   - `products/rpg-engine/workspaces/world/<slug>/setting.md`
   - `products/rpg-engine/workspaces/world/<slug>/rules_of_world.md`
   - `products/rpg-engine/workspaces/world/<slug>/tone_and_themes.md`
   - `products/rpg-engine/workspaces/world/<slug>/locations/<slug>.md`
   - `products/rpg-engine/workspaces/world/<slug>/characters/<slug>.md`
   - `products/rpg-engine/workspaces/world/<slug>/factions/<slug>.md`
   - `products/rpg-engine/workspaces/world/<slug>/species/<slug>.md`
   - `products/rpg-engine/workspaces/world/<slug>/scenarios/<scenario_slug>/scenario.md`
   - optional support-card folders such as `locations/`, `characters/`, `factions/`, `species/`, and `scenarios/`
4. If this is a newly created world workspace, initialize it as its own git repository so world canon can evolve independently from the product repository.
5. Keep the world contract internally consistent and usable by world-owned scenarios, world-owned characters, and adventures.
6. Surface missing inputs only when they block coherent world creation.

# Constraints

- do not advance live adventure state
- do not use read-only reference mode for creation work
- keep canon distinct from scenario-specific events
- keep all engine-side instructions in English
- do not create `rules/world_rules.md` just to restate the whole `world.md`; use it only for workspace-local guardrails that benefit from explicit rule form

# Output

1. created or updated world workspace content
2. concise description of the world foundations
3. next recommended step for scenario or character work
