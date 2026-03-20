# Adventure Workspace Structure

Root:
- `products/rpg-engine/workspace/adventure/<slug>/adventure.md`
- optional `products/rpg-engine/rules/workspace/adventure/<slug>.md`

Local core cards when first created in play:
- `products/rpg-engine/workspace/adventure/<slug>/world.md`
- `products/rpg-engine/workspace/adventure/<slug>/scenario.md`

Play state files:
- `products/rpg-engine/workspace/adventure/<slug>/current_scene.md`
- `products/rpg-engine/workspace/adventure/<slug>/state.yaml`
- `products/rpg-engine/workspace/adventure/<slug>/facts.yaml`
- `products/rpg-engine/workspace/adventure/<slug>/flags.yaml`
- `products/rpg-engine/workspace/adventure/<slug>/images/`

History:
- `products/rpg-engine/workspace/adventure/<slug>/events/`
- `products/rpg-engine/workspace/adventure/<slug>/sessions/`

Local support-card folders:
- `products/rpg-engine/workspace/adventure/<slug>/locations/`
- `products/rpg-engine/workspace/adventure/<slug>/quests/`
- `products/rpg-engine/workspace/adventure/<slug>/characters/`
- `products/rpg-engine/workspace/adventure/<slug>/factions/`
- `products/rpg-engine/workspace/adventure/<slug>/species/`

Primary card:
- `adventure.md` is the main readable source of truth for the run
- `products/rpg-engine/rules/workspace/adventure/<slug>.md` is the local constraint layer when this run needs explicit adventure-specific rules

When to use:
- use for any playable run
- anything first created during play stays here until explicitly promoted
- this workspace may be initialized as its own git repository
