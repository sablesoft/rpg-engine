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
- `products/rpg-engine/rules/data_rules.md`
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
3. Ensure the world title and any newly introduced entity names are distinct from other established entity names inside that same world context unless the same entity is intentionally being revised.
4. Create or update a `world` workspace under `products/rpg-engine/workspace/` following `products/rpg-engine/assets/workspace_templates/world_structure.md` and using:
   - `products/rpg-engine/workspace/world/<slug>/world.md`
   - `world.md` as the primary card
   - optional `products/rpg-engine/rules/workspace/world/<slug>.md` when this world needs explicit workspace-local invariants
   - `products/rpg-engine/workspace/world/<slug>/setting.md`
   - `products/rpg-engine/workspace/world/<slug>/rules_of_world.md`
   - `products/rpg-engine/workspace/world/<slug>/tone_and_themes.md`
   - `products/rpg-engine/workspace/world/<slug>/locations/<slug>.md`
   - `products/rpg-engine/workspace/world/<slug>/characters/<slug>.md`
   - `products/rpg-engine/workspace/world/<slug>/factions/<slug>.md`
   - `products/rpg-engine/workspace/world/<slug>/species/<slug>.md`
   - `products/rpg-engine/workspace/world/<slug>/scenarios/<scenario_slug>/scenario.md`
   - optional support-card folders such as `locations/`, `characters/`, `factions/`, `species/`, and `scenarios/`
5. If this is a newly created world workspace, initialize it as its own git repository so world canon can evolve independently from the product repository.
6. Keep the world contract internally consistent and usable by world-owned scenarios, world-owned characters, and adventures.
7. Surface missing inputs only when they block coherent world creation.

# Constraints

- do not use this skill to edit `rpg-engine` product contracts such as modes, skills, templates, or rules outside `rules/workspace/` beyond the workspace artifacts directly needed for the world
- do not advance live adventure state
- do not use read-only reference mode for creation work
- keep canon distinct from scenario-specific events
- keep all engine-side instructions in English
- do not create `rules/workspace/world/<slug>.md` just to restate the whole `world.md`; use it only for workspace-local guardrails that benefit from explicit rule form
- do not introduce a world or support entity title that duplicates another established entity title inside the same world context; add an epithet or qualifier instead
- when a created or updated mention points to an existing separate card with a known path, write it as a Markdown link

# Output

1. created or updated world workspace content
2. concise description of the world foundations
3. next recommended step for scenario or character work
