---
name: play-bootstrap-adventure
description: Guide the player from choosing or generating world, scenario, and protagonist inputs into a new playable adventure.
---

# Purpose

Provide a player-facing bootstrap flow that starts a new adventure without forcing the user through separate authoring steps.

# Read before acting

- `AGENTS.md`
- `state/runtime.yaml`
- `.agents/rules/engine_rules.md`
- `.agents/rules/product_rules.md`
- `.agents/rules/skill_rules.md`
- `products/rpg-engine/AGENTS.md`
- `products/rpg-engine/product.yaml`
- `products/rpg-engine/modes/play.yaml`
- `products/rpg-engine/rules/play_rules.md`
- `products/rpg-engine/rules/canon_rules.md`
- `products/rpg-engine/rules/workspace_rules.md`
- `products/rpg-engine/rules/data_rules.md`
- `products/rpg-engine/state/runtime.yaml`
- `products/rpg-engine/assets/workspace_dictionary/`
- `products/rpg-engine/assets/workspace_templates/adventure_structure.md`
- `products/rpg-engine/assets/workspace_templates/scene_structure.md`
- `products/rpg-engine/assets/workspace_templates/adventure_rules_template.md`
- `products/rpg-engine/skills/master-bootstrap-world/assets/world_card_template.md`
- `products/rpg-engine/skills/master-bootstrap-scenario/assets/scenario_card_template.md`
- `products/rpg-engine/skills/master-bootstrap-character/assets/character_card_template.md`
- `products/rpg-engine/skills/play-bootstrap-adventure/assets/adventure_card_template.md`
- `products/rpg-engine/skills/play-bootstrap-adventure/assets/adventure_option_template.md`
- `products/rpg-engine/skills/play-bootstrap-adventure/assets/entry_scene_option_template.md`
- `products/rpg-engine/skills/play-bootstrap-adventure/assets/state_template.yaml`
- `products/rpg-engine/skills/play-bootstrap-adventure/assets/facts_template.yaml`
- `products/rpg-engine/skills/play-bootstrap-adventure/assets/flags_template.yaml`
- `products/rpg-engine/skills/play-bootstrap-adventure/assets/adventure_scene_state_template.yaml`
- `products/rpg-engine/skills/play-bootstrap-adventure/assets/opening_current_scene_template.md`
- `products/rpg-engine/skills/play-bootstrap-adventure/assets/location_card_template.md`
- `products/rpg-engine/skills/play-bootstrap-adventure/assets/quest_card_template.md`
- `products/rpg-engine/skills/play-bootstrap-adventure/assets/world_bootstrap_checklist.md`
- `products/rpg-engine/skills/play-bootstrap-scene-instance/assets/scene_instance_state_template.yaml`
- `products/rpg-engine/skills/play-run-adventure/assets/scenario_log_template.md`

# Behavior

1. Determine whether the user wants to start a new adventure or continue an existing one.
2. If an existing playable adventure is selected, hand off to `play-run-adventure`.
3. If the user is starting a new adventure, guide them through the minimum playable chain:
   - choose or generate a `world`
   - choose or generate a `scenario`
   - choose or generate a protagonist `character`
   - create an `adventure` instance
   - establish an opening scene
4. At each step, prefer existing compatible world or adventure repositories when the user wants to choose from known content.
5. If the user does not have a preference, offer a compact set of distinct options before creating anything.
6. If the user wants something new on the fly, create only the missing pieces needed to enter play quickly.
7. If a new adventure is created, initialize `products/rpg-engine/workspace/adventure/<slug>/` as its own git repository.
8. Update product runtime pointers so the newly selected or created context can be resumed later.
9. Ensure the created or selected inputs are internally compatible before entering live play.
10. Resolve the adventure's starting scenario before instantiating the opening scene; the starting scenario may be preselected, dynamically created, or chosen from a small compatible set.
11. Apply the default locality rule from `products/rpg-engine/rules/data_rules.md`.
12. Ensure any newly created local entities for the run use visible names that do not collide with other established entity names inside the same world context unless the same entity is intentionally being reused.
13. Respect optional workspace rule layers when they exist; if one is absent, continue without adding that layer.
14. When explicit scoped local rules already exist for the selected world, scenario, protagonist, or other immediately relevant entity, carry them forward as active play constraints for the new run.
15. Present the selected scenario's short player-facing introduction exactly once before the opening scene begins.
16. Resolve the selected scenario's opening-scene policy before entering live play.
17. Create the opening scene through the scene-instance model rather than relying only on freeform `current_scene.md`.
18. Finish with a clear opening situation and transition naturally into `play-run-adventure`.
19. During new-adventure bootstrap, treat every other `adventure` workspace as completely off-limits to reading.
20. During new-adventure bootstrap, verify provenance before reusing any established named entity: only `world` and world-owned `scenario` or `character` content may be reused as preexisting canon.
21. If a needed named entity exists only inside another adventure, do not import it; either create a new local entity for the current run or stay at a more abstract world/scenario level.

# Selection and generation flow

- world:
  - list existing worlds when available
  - if none fit, generate a compact local world foundation inside the adventure with enough canon for immediate play
- scenario:
  - prefer scenarios that belong to the selected world repository
  - if none fit, generate a local scenario inside the adventure tied to that selected or local world
  - every selected or generated scenario must provide a short player-facing introduction shown exactly once before the opening scene
  - every selected or generated scenario must expose an opening-scene policy before play starts
- character:
  - prefer characters that belong to the selected world repository and fit the scenario
  - if none fit, propose 3 distinct protagonist options derived from the character card model and create the selected one
- provenance discipline:
  - for a new adventure, do not browse sibling `adventure` workspaces just to find reusable names, places, factions, or hooks
  - do not read sibling `adventure` workspaces for structure, format examples, templates, protocol shape, migration clues, or any other fallback
  - when in doubt about an entity's scope, default to treating it as unavailable canon for the new run until its promotion is explicitly confirmed
- adventure:
  - create one playthrough instance from the selected world, scenario, and protagonist following `products/rpg-engine/assets/workspace_templates/adventure_structure.md`
  - prepare:
    - `products/rpg-engine/workspace/adventure/<slug>/adventure.md`
    - optional `products/rpg-engine/rules/workspace/adventure/<slug>.md`
    - optional local `products/rpg-engine/workspace/adventure/<slug>/world.md`
    - optional local `products/rpg-engine/workspace/adventure/<slug>/scenario.md`
    - `products/rpg-engine/workspace/adventure/<slug>/current_scene.md` as a lightweight opening snapshot
    - `products/rpg-engine/workspace/adventure/<slug>/scene_state.yaml`
    - optional `products/rpg-engine/workspace/adventure/<slug>/scenario_log.md`
    - `products/rpg-engine/workspace/adventure/<slug>/state.yaml`
    - `products/rpg-engine/workspace/adventure/<slug>/facts.yaml`
    - `products/rpg-engine/workspace/adventure/<slug>/flags.yaml`
    - `products/rpg-engine/workspace/adventure/<slug>/scenes/<scene_instance_id>/`
    - `products/rpg-engine/workspace/adventure/<slug>/events/<id>.md`
    - `products/rpg-engine/workspace/adventure/<slug>/sessions/<id>.md`
    - local support cards under `locations/`, `quests/`, `characters/`, `factions/`, `species/` when needed
  - when existing scoped local rule files already define meaningful play behavior for the selected content, preserve and honor them rather than flattening them into plain flavor text
  - when an opening reusable scene definition exists in the selected world or scenario, prefer instantiating it instead of inventing a purely implicit opening scene
  - when the selected scenario exposes multiple prepared opening scenes, offer a compact choice set rather than collapsing them prematurely
  - when the selected scenario exposes dynamic opening-scene guidance instead of a prepared definition, generate an adventure-local scene definition first and then instantiate it

# Constraints

- do not force the user into `master` when their intent is to begin playing now
- do not redesign world canon beyond what is needed for an immediately playable setup
- do not store bootstrap phase flags in engine runtime
- do not store full canon or full adventure state in product runtime
- do not violate the default locality rule from `products/rpg-engine/rules/data_rules.md`
- do not enter live play before a world, scenario, protagonist, and opening situation are all established
- do not skip the selected scenario's player-facing introduction before launching its opening scene
- do not repeat that scenario introduction on later question turns inside the opening scene unless the user explicitly asks for a recap
- do not enter live play before the starting scenario and that scenario's opening-scene policy are both resolved
- do not create `rules/workspace/adventure/<slug>.md` unless the run actually needs explicit local constraints
- do not discard or ignore relevant scoped local rules that should meaningfully shape the opening situation, NPC behavior, scene framing, or environmental logic
- do not create a local adventure entity with a visible title that duplicates another established entity title inside the same world context unless the user is clearly reusing that same entity
- when bootstrap content mentions an entity that already has a known separate card, link that mention to the card
- do not read any other `products/rpg-engine/workspace/adventure/<slug>/` content during new-adventure bootstrap for any reason
- do not import adventure-local entities from another run into the new run unless their promotion into world or scenario scope is explicitly established
- do not use another adventure as evidence that a name, place, faction, or scene already belongs to the selected scenario

# Output

1. selected or created play inputs
2. created or updated adventure bootstrap content
3. opening situation that can continue directly in `@play`
