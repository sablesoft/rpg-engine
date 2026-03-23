# Scene Structure

Reusable scene definitions:

- world-owned:
  - `products/rpg-engine/workspace/world/<world_slug>/scenes/<scene_slug>/scene.md`
- scenario-owned:
  - `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/scenes/<scene_slug>/scene.md`

Optional support files for a reusable scene definition:
- `state_template.yaml`
- `log_template.md`
- `mechanics.md`
- `examples.md`

Scene instances inside an adventure:
- adventure-local scene definitions:
  - `products/rpg-engine/workspace/adventure/<adventure_slug>/scenes/definitions/<scene_slug>/scene.md`
  - optional support files:
    - `state_template.yaml`
    - `log_template.md`
- `products/rpg-engine/workspace/adventure/<adventure_slug>/scenes/<scene_instance_id>/state.yaml`
- optional `products/rpg-engine/workspace/adventure/<adventure_slug>/scenes/<scene_instance_id>/log.md`

Current-scene projection:
- `products/rpg-engine/workspace/adventure/<adventure_slug>/current_scene.md`
- `products/rpg-engine/workspace/adventure/<adventure_slug>/scene_state.yaml`
- `current_scene.md` is a lightweight player-facing snapshot, not the primary transcript of the active scene
- the full turn-by-turn record belongs in the scene-instance log

Definition guidance:
- a reusable scene definition is canonical and stable
- it may describe framing, rules, inputs, parameters, completion conditions, result contract, transition guidance, and the templates for mutable execution state and scene log
- its `state_template.yaml` and `log_template.md` should extend a shared scene-engine skeleton while remaining free to add scene-specific fields and sections
- it should not carry global invocation triggers; invocation belongs to the caller scene or owning context
- it may be reused across many adventure runs
- `master` is the primary authoring mode for reusable canonical definitions, but `play` may generate adventure-local definitions when live context demands them

Instance guidance:
- a scene instance is mutable play-state
- it tracks compact resumable structure such as status, phase, bindings, nested-scene stack pointers, outputs, and log
- its `log.md` is the primary turn-by-turn execution record and should begin with the opening framing and first offered decision point for that scene instance
- its `state.yaml` should stay deliberately small and should not duplicate prompt prose, rolling player-input transcripts, or other material already present in the log
- it may execute a prepared reusable scene definition or a dynamically generated adventure-local definition that is still bound to the active world or scenario
