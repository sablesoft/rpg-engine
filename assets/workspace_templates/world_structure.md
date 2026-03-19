# World Workspace Structure

Root:
- `products/rpg-engine/workspaces/world/<slug>/world.md`

Optional support files:
- `products/rpg-engine/workspaces/world/<slug>/setting.md`
- `products/rpg-engine/workspaces/world/<slug>/rules_of_world.md`
- `products/rpg-engine/workspaces/world/<slug>/tone_and_themes.md`
- `products/rpg-engine/workspaces/world/<slug>/global_story.md`

Optional support-card folders:
- `products/rpg-engine/workspaces/world/<slug>/locations/`
- `products/rpg-engine/workspaces/world/<slug>/characters/`
- `products/rpg-engine/workspaces/world/<slug>/factions/`
- `products/rpg-engine/workspaces/world/<slug>/species/`
- `products/rpg-engine/workspaces/world/<slug>/scenarios/`

World-owned scenarios:
- `products/rpg-engine/workspaces/world/<slug>/scenarios/<scenario_slug>/scenario.md`
- `products/rpg-engine/workspaces/world/<slug>/scenarios/<scenario_slug>/global_story.md`
- `products/rpg-engine/workspaces/world/<slug>/scenarios/<scenario_slug>/tone_and_themes.md`
- `products/rpg-engine/workspaces/world/<slug>/scenarios/<scenario_slug>/quests/`
- `products/rpg-engine/workspaces/world/<slug>/scenarios/<scenario_slug>/locations/`
- `products/rpg-engine/workspaces/world/<slug>/scenarios/<scenario_slug>/characters/`

World-owned global characters:
- `products/rpg-engine/workspaces/world/<slug>/characters/<character_slug>.md`

Primary card:
- `world.md` is the main readable source of truth

When to use:
- use for global world canon promoted to workspace scope
- do not use for local world content that still belongs only to one adventure
- this workspace may be initialized as its own git repository
