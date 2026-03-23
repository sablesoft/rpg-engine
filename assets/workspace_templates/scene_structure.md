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
- `products/rpg-engine/workspace/adventure/<adventure_slug>/scenes/<scene_instance_id>/scene.md`
- `products/rpg-engine/workspace/adventure/<adventure_slug>/scenes/<scene_instance_id>/state.yaml`
- optional `products/rpg-engine/workspace/adventure/<adventure_slug>/scenes/<scene_instance_id>/log.md`

Current-scene projection:
- `products/rpg-engine/workspace/adventure/<adventure_slug>/current_scene.md`
- `products/rpg-engine/workspace/adventure/<adventure_slug>/scene_state.yaml`

Definition guidance:
- a reusable scene definition is canonical and stable
- it may describe framing, rules, inputs, parameters, completion conditions, result contract, transition guidance, and the templates for mutable execution state and scene log
- its `state_template.yaml` and `log_template.md` should extend a shared scene-engine skeleton while remaining free to add scene-specific fields and sections
- it should not carry global invocation triggers; invocation belongs to the caller scene or owning context
- it may be reused across many adventure runs
- `master` is the primary authoring mode for reusable canonical definitions, but `play` may generate adventure-local definitions when live context demands them

Instance guidance:
- a scene instance is mutable play-state
- it tracks the active step, phase, parameters, bindings, nested-scene stack, pending choice, results, and log
- it may execute a prepared reusable scene definition or a dynamically generated adventure-local definition that is still bound to the active world or scenario
