---
name: master-bootstrap-scene
description: Create or revise a reusable scene definition attached to one world or one world-owned scenario.
---

# Purpose

Create canonical reusable scene definitions for `rpg-engine` that can later be instantiated during `play`.

# Read before acting

- `AGENTS.md`
- `state/runtime.yaml`
- `.agents/rules/engine_rules.md`
- `.agents/rules/product_rules.md`
- `.agents/rules/skill_rules.md`
- `products/rpg-engine/AGENTS.md`
- `products/rpg-engine/product.yaml`
- `products/rpg-engine/modes/master.yaml`
- `products/rpg-engine/rules/data_rules.md`
- `products/rpg-engine/rules/play_rules.md`
- `products/rpg-engine/assets/workspace_templates/scene_structure.md`
- `products/rpg-engine/skills/master-bootstrap-scene/assets/scene_card_template.md`
- `products/rpg-engine/skills/master-bootstrap-scene/assets/state_template.yaml`
- `products/rpg-engine/skills/master-bootstrap-scene/assets/log_template.md`

# Behavior

1. Confirm whether the scene belongs to one `world` or one world-owned `scenario`.
2. Define the scene's reusable purpose, framing, participant expectations, rules, parameters, completion conditions, result contract, and transition guidance.
3. Ensure the scene title and any newly introduced named entities remain unique inside the same world context unless the same entity is intentionally being revised.
4. Create or update the scene definition package:
   - world-owned:
     - `products/rpg-engine/workspace/world/<world_slug>/scenes/<scene_slug>/scene.md`
   - scenario-owned:
     - `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/scenes/<scene_slug>/scene.md`
   - plus:
     - `state_template.yaml`
     - `log_template.md`
   - and optional support files such as:
     - `mechanics.md`
     - `examples.md`
5. Keep the scene reusable across many adventure runs.
6. Keep invocation triggers outside the reusable scene definition itself; document only entry requirements, expected inputs, and transition hints.
7. Treat this skill as the canonical authoring path for world- and scenario-owned scene definitions; dynamic adventure-local scene definitions created in `play` may later be promoted into this broader form.
8. Build `state_template.yaml` and `log_template.md` on top of the shared scene-engine skeleton, then extend them with any scene-specific fields or log sections the concrete mechanic requires.

# Constraints

- do not use this skill to edit `rpg-engine` product contracts outside workspace content and `rules/workspace/`; broader refactors belong to `@dev`
- do not create a reusable scene that is detached from a concrete world or world-owned scenario
- do not store mutable run progress in the reusable scene definition
- do not hide the shape of mutable execution state; define it explicitly in `state_template.yaml`
- do not omit the log template when the scene expects multiple iterations, nested calls, or meaningful step history
- do not force every scene into the exact same static state or log body; extend the shared skeleton when the mechanic requires extra fields
- when a created or updated mention points to an existing separate card with a known path, write it as a Markdown link

# Output

1. created or updated reusable scene definition package
2. concise note on what the scene is for and where it belongs
3. next recommended step for instancing or surrounding scenario/play setup
