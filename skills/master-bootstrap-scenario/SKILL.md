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
- `products/rpg-engine/assets/workspace-dictionary/`
- `products/rpg-engine/assets/workspace-templates/scenario_structure.md`
- `products/rpg-engine/skills/master-bootstrap-scenario/assets/scenario_card_template.md`
- `products/rpg-engine/skills/master-bootstrap-scenario/assets/global_story_template.md`
- `products/rpg-engine/skills/master-bootstrap-scenario/assets/tone_and_theme_template.md`
- `products/rpg-engine/skills/master-bootstrap-scenario/assets/quest_card_template.md`

# Behavior

1. Confirm the target world context and locate the owning world repository.
2. Define the scenario premise, stakes, conflicts, major actors, locations, acts, and likely outcomes.
3. Define a short player-facing introduction that should be shown exactly once before the opening scene starts.
4. Define the scenario's opening-scene policy as one of:
   - one prepared opening scene
   - a small prepared choice set of opening scenes
   - dynamic opening-scene generation guidance
5. Ensure the scenario title and any newly introduced entity names are distinct from other established entity names inside that same world context unless the same entity is intentionally being revised.
6. Create or update a world-owned scenario structure following `products/rpg-engine/assets/workspace-templates/scenario_structure.md` and using:
   - `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/scenario.md`
   - `scenario.md` as the primary card
   - `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/global_story.md`
   - `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/tone_and_themes.md`
   - optional support files such as `global_story.md` and `tone_and_themes.md`
   - `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/quests/<slug>.md`
   - `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/locations/<slug>.md`
   - `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/characters/<slug>.md`
   - optional support-card folders such as `quests/`, `locations/`, and `characters/`
7. Ensure the scenario depends on world canon instead of redefining it.
8. Keep enough structure for later adventure setup and play.
9. When the opening scene is prepared rather than dynamic, ensure the scenario owns the reusable scene definition under its `scenes/` folder.

# Constraints

- do not use this skill to edit `rpg-engine` product contracts such as modes, skills, templates, or rules outside `rules/workspace/` beyond the workspace artifacts directly needed for the scenario
- do not overwrite world canon with scenario-local assumptions
- do not treat one scenario as the whole world history
- do not advance an existing adventure during scenario design
- do not leave a scenario without a short player-facing introduction
- do not leave a scenario without an opening-scene policy
- do not introduce a scenario or support entity title that duplicates another established entity title inside the same world context; add an epithet or qualifier instead
- when a created or updated mention points to an existing separate card with a known path, write it as a Markdown link

# Output

1. created or updated scenario content inside the world repository
2. concise description of the playable scenario structure
3. next recommended step for character or adventure setup
