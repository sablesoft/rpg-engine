---
name: play-run-adventure
description: Run an RPG adventure turn by turn with narration, choices, and consequence tracking.
---

# Purpose

Advance one adventure instance through scenes, player choices, and resulting state changes.

# Read before acting

- `AGENTS.md`
- `state/runtime.yaml`
- `.agents/rules/engine_rules.md`
- `.agents/rules/product_rules.md`
- `.agents/rules/skill_rules.md`
- `products/rpg-engine/product.yaml`
- `products/rpg-engine/modes/play.yaml`
- `products/rpg-engine/rules/play_rules.md`
- `products/rpg-engine/rules/workspace_rules.md`
- `products/rpg-engine/rules/data_rules.md`
- `products/rpg-engine/assets/workspace-dictionary/`
- `products/rpg-engine/assets/workspace-templates/adventure_structure.md`
- `products/rpg-engine/assets/workspace-templates/scene_structure.md`
- `products/rpg-engine/skills/play-run-adventure/assets/current_scene_template.md`
- `products/rpg-engine/skills/play-run-adventure/assets/scenario_log_template.md`
- `products/rpg-engine/skills/play-run-adventure/assets/event_template.md`
- `products/rpg-engine/skills/play-run-adventure/assets/session_log_template.md`
- `products/rpg-engine/skills/play-bootstrap-adventure/assets/adventure_scene_state_template.yaml`

# Behavior

1. Confirm the target adventure instance and current scene context.
2. If the user is clearly trying to start a new game rather than continue one, hand off to `play-bootstrap-adventure`.
3. Read and update only the target adventure instance and its directly relevant world/scenario/rule layers.
4. Read and update adventure files under:
   - `products/rpg-engine/workspace/adventure/<slug>/adventure.md`
   - `products/rpg-engine/workspace/adventure/<slug>/current_scene.md`
   - `products/rpg-engine/workspace/adventure/<slug>/scene_state.yaml`
   - `products/rpg-engine/workspace/adventure/<slug>/scenario_log.md` when present
   - `products/rpg-engine/workspace/adventure/<slug>/state.yaml`
   - `products/rpg-engine/workspace/adventure/<slug>/facts.yaml`
   - `products/rpg-engine/workspace/adventure/<slug>/flags.yaml`
   - `products/rpg-engine/workspace/adventure/<slug>/scenes/<scene_instance_id>/state.yaml`
   - `products/rpg-engine/workspace/adventure/<slug>/scenes/<scene_instance_id>/log.md` when present
   - `products/rpg-engine/workspace/adventure/<slug>/events/<id>.md`
   - `products/rpg-engine/workspace/adventure/<slug>/sessions/<id>.md`
   - `products/rpg-engine/rules/workspace/global.md` when present
   - `products/rpg-engine/rules/workspace/adventure/<slug>.md` when present
   - local support cards under `locations/`, `quests/`, `characters/`, `factions/`, `species/` when relevant
   - local `world.md` or `scenario.md` when present, otherwise the selected global world repository and its world-owned scenario content
   - `products/rpg-engine/rules/workspace/world/<world_slug>.md` when that world workspace exists and defines local rules
   - other scoped files under `products/rpg-engine/rules/workspace/<scope_type>/<entity_slug>.md` when the current scene depends on that concrete scenario, character, location, quest, faction, species, item, or other product-defined entity
   - skip any absent optional rule layer without treating it as an error
5. Treat the active scene instance as the execution unit for the current turn and respect its definition, binding, current phase, log, nested stack, and completion conditions.
6. Present the immediate situation, available options, risks, and observable facts.
7. Resolve the player's action according to world rules, scenario pressure, character capabilities, the active scene definition, and any relevant scoped local rule files.
8. When the current scene calls for a child scene, pause the parent and create a nested scene instance rather than flattening the child into the parent's prose.
9. When the current scene completes, use its result contract to either:
   - resume its parent scene
   - instantiate the next chained scene
   - or return control to free play framing
10. When the current scene completes, append a compact scenario-level summary entry to `scenario_log.md` based on the completed scene log when scenario logging is in use for that adventure.
11. When new local entities are introduced during play, give them visible names that do not collide with other established entity names inside the same world context unless the same entity is intentionally being referenced again.
12. When the player asks a direct identifying question about a named or clearly individuated in-scene entity and that entity does not already have its own card, create the appropriate adventure-local card in the same pass when the entity has become stable enough to deserve one.
13. After materializing such a card, update the directly touched scene or content files so the entity is linked to the new card.
14. Update the scene log on each meaningful turn and keep instance/adventure state writes minimal.
15. Update `current_scene.md` only when the visible player-facing situation, location, or active decision point has meaningfully changed.
16. Update the adventure state, consequences, and newly learned information only when the turn actually changes durable run state or when the scene reaches a meaningful checkpoint or completion.
17. End with a clear next decision point unless the scene fully concludes.

# Constraints

- do not redesign core canon during live play
- do not answer as a read-only encyclopedia
- do not read any sibling, older, or unrelated adventure workspace while resolving the current run
- do not skip consequence updates after meaningful player actions
- do not leave a newly clarified stable entity stranded only inside scene prose when the player's direct question clearly established it as a reusable adventure entity
- do not violate established workspace-local world or adventure rules
- do not ignore relevant scoped local rules for concrete entities that materially shape the active scene
- do not fail or stall because an optional workspace rule file is absent
- treat relevant scoped local rules as active gameplay constraints and behavior instructions, not as passive metadata
- do not keep the real active-scene phase, stack, or completion-relevant execution state only inside transient model context
- do not mutate the reusable scene definition while resolving one instance
- do not promote a local entity rule into general world law unless the canon already supports that broader scope
- do not introduce a new local entity under a visible title that already belongs to a different established entity inside the same world context; add an epithet or qualifier instead
- do not rewrite adventure cards, current-scene projections, or scene-instance state on every micro-turn when a short scene-log append is enough
- do not let `current_scene.md` bloat into a duplicate of the active scene log
- do not duplicate prompt prose or rolling player-input transcripts across both `state.yaml` and `log.md`
- do not dump a whole scene log verbatim into `scenario_log.md`; write a compact scenario-level summary instead
- when updating cards during play, link mentions of entities that already have known separate cards

# Output

1. advanced adventure state
2. narrated scene result and current consequences
3. clear prompt for the next player decision
