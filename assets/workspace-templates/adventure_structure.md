# Adventure Workspace Structure

Root:
- `products/rpg-engine/workspace/adventure/<slug>/adventure.md`
- optional `products/rpg-engine/rules/workspace/adventure/<slug>.md`

Local core cards when first created in play:
- `products/rpg-engine/workspace/adventure/<slug>/world.md`
- `products/rpg-engine/workspace/adventure/<slug>/scenario.md`

Play state files:
- `products/rpg-engine/workspace/adventure/<slug>/current_scene.md` as a lightweight player-facing snapshot of the active scene
- `products/rpg-engine/workspace/adventure/<slug>/scene_state.yaml`
- optional `products/rpg-engine/workspace/adventure/<slug>/scenario_log.md`
- `products/rpg-engine/workspace/adventure/<slug>/state.yaml`
- `products/rpg-engine/workspace/adventure/<slug>/facts.yaml`
- `products/rpg-engine/workspace/adventure/<slug>/flags.yaml`
- `products/rpg-engine/workspace/adventure/<slug>/images/`

Shared play templates:
- opening bootstrap `current_scene.md` may use `products/rpg-engine/skills/play-bootstrap-adventure/assets/opening_current_scene_template.md`
- ongoing turn `current_scene.md` may use `products/rpg-engine/skills/play-run-adventure/assets/current_scene_template.md`
- adventure-level `scene_state.yaml` may use `products/rpg-engine/skills/play-bootstrap-adventure/assets/adventure_scene_state_template.yaml`
- `scenario_log.md` may use `products/rpg-engine/skills/play-run-adventure/assets/scenario_log_template.md`

Scene instances:
- `products/rpg-engine/workspace/adventure/<slug>/scenes/definitions/<scene_slug>/scene.md`
- optional `products/rpg-engine/workspace/adventure/<slug>/scenes/definitions/<scene_slug>/state_template.yaml`
- optional `products/rpg-engine/workspace/adventure/<slug>/scenes/definitions/<scene_slug>/log_template.md`
- `products/rpg-engine/workspace/adventure/<slug>/scenes/<scene_instance_id>/state.yaml`
- optional `products/rpg-engine/workspace/adventure/<slug>/scenes/<scene_instance_id>/log.md`

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
