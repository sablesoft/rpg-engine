---
name: play-bootstrap-scene-instance
description: Create a mutable adventure-local scene instance from a reusable or freshly generated scene definition.
---

# Purpose

Instantiate the next active scene for `play`, using either a prepared world/scenario scene definition or a newly generated adventure-local scene definition bound to the current world or scenario context.

# Read before acting

- `AGENTS.md`
- `state/runtime.yaml`
- `.agents/rules/engine_rules.md`
- `.agents/rules/product_rules.md`
- `.agents/rules/skill_rules.md`
- `products/rpg-engine/AGENTS.md`
- `products/rpg-engine/product.yaml`
- `products/rpg-engine/modes/play.yaml`
- `products/rpg-engine/rules/data_rules.md`
- `products/rpg-engine/rules/play_rules.md`
- `products/rpg-engine/assets/workspace_templates/scene_structure.md`
- `products/rpg-engine/skills/play-bootstrap-scene-instance/assets/scene_instance_card_template.md`
- `products/rpg-engine/skills/play-bootstrap-scene-instance/assets/scene_instance_state_template.yaml`
- `products/rpg-engine/skills/play-bootstrap-scene-instance/assets/scene_instance_log_template.md`

# Behavior

1. Confirm the active adventure and the world/scenario context that owns the next scene definition.
2. Prefer an existing reusable scene definition when one already fits the current need.
3. If no reusable scene definition fits, create a new adventure-local scene definition under:
   - `products/rpg-engine/workspace/adventure/<adventure_slug>/scenes/definitions/<scene_slug>/scene.md`
   - optional `state_template.yaml`
   - optional `log_template.md`
   that is still explicitly bound to the active world or scenario context.
4. Create the mutable scene instance package under:
   - `products/rpg-engine/workspace/adventure/<adventure_slug>/scenes/<scene_instance_id>/scene.md`
   - `products/rpg-engine/workspace/adventure/<adventure_slug>/scenes/<scene_instance_id>/state.yaml`
   - optional `products/rpg-engine/workspace/adventure/<adventure_slug>/scenes/<scene_instance_id>/log.md`
5. Update:
   - `products/rpg-engine/workspace/adventure/<adventure_slug>/current_scene.md`
   - `products/rpg-engine/workspace/adventure/<adventure_slug>/scene_state.yaml`
   so the active instance, stack, parent/child relation, and resumable pointer are explicit.
6. Carry forward the selected definition's rules, state template shape, log template shape, and scene binding into the new instance.
7. When instantiating a nested scene, pause the parent scene explicitly before activating the child instance.
8. Keep any freshly generated scene definition stable after creation; later turns should update only the instance state and log unless the user explicitly switches into authoring intent.

# Constraints

- do not instantiate a scene without a stable scene definition artifact
- do not mutate reusable world- or scenario-owned scene definitions during live play
- do not create an adventure-local scene definition that is detached from the active world or active scenario context
- do not keep active multi-step scene progress only in transient model memory
- do not lose parent/child scene relationships when nesting occurs
- when writing instance-facing mentions of entities that already have known separate cards, link them with Markdown links

# Output

1. created or updated scene instance package
2. note on which definition the instance uses
3. active scene handoff ready for `play-run-adventure`
