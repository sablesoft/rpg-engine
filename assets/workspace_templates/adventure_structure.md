# Adventure Workspace Structure

Root:
- `products/rpg-engine/workspaces/adventure/<slug>/adventure.md`

Local core cards when first created in play:
- `products/rpg-engine/workspaces/adventure/<slug>/world.md`
- `products/rpg-engine/workspaces/adventure/<slug>/scenario.md`

Play state files:
- `products/rpg-engine/workspaces/adventure/<slug>/current_scene.md`
- `products/rpg-engine/workspaces/adventure/<slug>/state.yaml`
- `products/rpg-engine/workspaces/adventure/<slug>/facts.yaml`
- `products/rpg-engine/workspaces/adventure/<slug>/flags.yaml`
- `products/rpg-engine/workspaces/adventure/<slug>/images/`

History:
- `products/rpg-engine/workspaces/adventure/<slug>/events/`
- `products/rpg-engine/workspaces/adventure/<slug>/sessions/`

Local support-card folders:
- `products/rpg-engine/workspaces/adventure/<slug>/locations/`
- `products/rpg-engine/workspaces/adventure/<slug>/quests/`
- `products/rpg-engine/workspaces/adventure/<slug>/characters/`
- `products/rpg-engine/workspaces/adventure/<slug>/factions/`
- `products/rpg-engine/workspaces/adventure/<slug>/species/`

Primary card:
- `adventure.md` is the main readable source of truth for the run

When to use:
- use for any playable run
- anything first created during play stays here until explicitly promoted
- this workspace may be initialized as its own git repository
