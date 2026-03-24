# Scenario Structure Inside A World Repository

Root:
- `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/scenario.md`

Optional support files:
- `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/global_story.md`
- `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/tone_and_themes.md`
- `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/images/`

Optional support-card folders:
- `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/quests/`
- `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/locations/`
- `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/characters/`
- `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/scenes/`

Primary card:
- `scenario.md` is the main readable source of truth

When to use:
- use for global scenario canon inside a world repository
- do not use for local scenario content that still belongs only to one adventure

Scenario-owned reusable scenes:
- `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/scenes/<scene_slug>/scene.md`
- optional support files such as:
  - `state_template.yaml`
  - `log_template.md`
  - `mechanics.md`
  - `examples.md`
