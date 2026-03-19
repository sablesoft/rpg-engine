# Scenario Structure Inside A World Repository

Root:
- `products/rpg-engine/workspaces/world/<world_slug>/scenarios/<scenario_slug>/scenario.md`

Optional support files:
- `products/rpg-engine/workspaces/world/<world_slug>/scenarios/<scenario_slug>/global_story.md`
- `products/rpg-engine/workspaces/world/<world_slug>/scenarios/<scenario_slug>/tone_and_themes.md`

Optional support-card folders:
- `products/rpg-engine/workspaces/world/<world_slug>/scenarios/<scenario_slug>/quests/`
- `products/rpg-engine/workspaces/world/<world_slug>/scenarios/<scenario_slug>/locations/`
- `products/rpg-engine/workspaces/world/<world_slug>/scenarios/<scenario_slug>/characters/`

Primary card:
- `scenario.md` is the main readable source of truth

When to use:
- use for global scenario canon inside a world repository
- do not use for local scenario content that still belongs only to one adventure
