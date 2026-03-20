---
name: master-bootstrap-scenario
description: Create a scenario or campaign inside an existing RPG world.
---

# Purpose

Create a scenario inside one world repository, with plot structure, stakes, factions, and playable progression.

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
- `products/rpg-engine/assets/workspace_templates/scenario_structure.md`
- `products/rpg-engine/skills/master-bootstrap-scenario/assets/scenario_card_template.md`
- `products/rpg-engine/skills/master-bootstrap-scenario/assets/global_story_template.md`
- `products/rpg-engine/skills/master-bootstrap-scenario/assets/tone_and_theme_template.md`
- `products/rpg-engine/skills/master-bootstrap-scenario/assets/quest_card_template.md`

# Behavior

1. Confirm the target world context and locate the owning world repository.
2. Define the scenario premise, stakes, conflicts, major actors, locations, acts, and likely outcomes.
3. Create or update a world-owned scenario structure following `products/rpg-engine/assets/workspace_templates/scenario_structure.md` and using:
   - `products/rpg-engine/workspaces/world/<world_slug>/scenarios/<scenario_slug>/scenario.md`
   - `scenario.md` as the primary card
   - `products/rpg-engine/workspaces/world/<world_slug>/scenarios/<scenario_slug>/global_story.md`
   - `products/rpg-engine/workspaces/world/<world_slug>/scenarios/<scenario_slug>/tone_and_themes.md`
   - optional support files such as `global_story.md` and `tone_and_themes.md`
   - `products/rpg-engine/workspaces/world/<world_slug>/scenarios/<scenario_slug>/quests/<slug>.md`
   - `products/rpg-engine/workspaces/world/<world_slug>/scenarios/<scenario_slug>/locations/<slug>.md`
   - `products/rpg-engine/workspaces/world/<world_slug>/scenarios/<scenario_slug>/characters/<slug>.md`
   - optional support-card folders such as `quests/`, `locations/`, and `characters/`
4. Ensure the scenario depends on world canon instead of redefining it.
5. Keep enough structure for later adventure setup and play.

# Constraints

- do not overwrite world canon with scenario-local assumptions
- do not treat one scenario as the whole world history
- do not advance an existing adventure during scenario design
- when a created or updated mention points to an existing separate card with a known path, write it as a Markdown link

# Output

1. created or updated scenario content inside the world repository
2. concise description of the playable scenario structure
3. next recommended step for character or adventure setup
