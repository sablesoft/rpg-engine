# World Workspace Structure

Root:
- `products/rpg-engine/workspace/world/<slug>/world.md`
- optional `products/rpg-engine/rules/workspace/world/<slug>.md`

Optional support files:
- `products/rpg-engine/workspace/world/<slug>/setting.md`
- `products/rpg-engine/workspace/world/<slug>/rules_of_world.md`
- `products/rpg-engine/workspace/world/<slug>/tone_and_themes.md`
- `products/rpg-engine/workspace/world/<slug>/global_story.md`
- `products/rpg-engine/workspace/world/<slug>/images/`

Optional support-card folders:
- `products/rpg-engine/workspace/world/<slug>/locations/`
- `products/rpg-engine/workspace/world/<slug>/characters/`
- `products/rpg-engine/workspace/world/<slug>/factions/`
- `products/rpg-engine/workspace/world/<slug>/species/`
- `products/rpg-engine/workspace/world/<slug>/scenes/`
- `products/rpg-engine/workspace/world/<slug>/scenarios/`

World-owned scenarios:
- `products/rpg-engine/workspace/world/<slug>/scenarios/<scenario_slug>/scenario.md`
- `products/rpg-engine/workspace/world/<slug>/scenarios/<scenario_slug>/global_story.md`
- `products/rpg-engine/workspace/world/<slug>/scenarios/<scenario_slug>/tone_and_themes.md`
- `products/rpg-engine/workspace/world/<slug>/scenarios/<scenario_slug>/images/`
- `products/rpg-engine/workspace/world/<slug>/scenarios/<scenario_slug>/quests/`
- `products/rpg-engine/workspace/world/<slug>/scenarios/<scenario_slug>/locations/`
- `products/rpg-engine/workspace/world/<slug>/scenarios/<scenario_slug>/characters/`
- `products/rpg-engine/workspace/world/<slug>/scenarios/<scenario_slug>/scenes/`

World-owned global characters:
- `products/rpg-engine/workspace/world/<slug>/characters/<character_slug>.md`

World-owned reusable scenes:
- `products/rpg-engine/workspace/world/<slug>/scenes/<scene_slug>/scene.md`
- optional support files such as:
  - `state_template.yaml`
  - `log_template.md`
  - `mechanics.md`
  - `examples.md`

Primary card:
- `world.md` is the main readable source of truth
- `products/rpg-engine/rules/workspace/world/<slug>.md` is the local invariant layer when this world needs explicit workspace-specific rules

When to use:
- use for global world canon promoted to workspace scope
- do not use for local world content that still belongs only to one adventure
- this workspace may be initialized as its own git repository
