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
- `products/rpg-engine/skills/play-bootstrap-adventure/assets/location_card_template.md`
- `products/rpg-engine/skills/play-bootstrap-adventure/assets/quest_card_template.md`
- `products/rpg-engine/skills/play-bootstrap-adventure/assets/world_bootstrap_checklist.md`

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
7. If a new adventure is created, initialize `products/rpg-engine/workspaces/adventure/<slug>/` as its own git repository.
8. Update product runtime pointers so the newly selected or created context can be resumed later.
9. Ensure the created or selected inputs are internally compatible before entering live play.
10. Apply the default locality rule from `products/rpg-engine/rules/data_rules.md`.
11. If the selected world or created adventure defines workspace-local rules, respect them during bootstrap.
12. Finish with a clear opening situation and transition naturally into `play-run-adventure`.

# Selection and generation flow

- world:
  - list existing worlds when available
  - if none fit, generate a compact local world foundation inside the adventure with enough canon for immediate play
- scenario:
  - prefer scenarios that belong to the selected world repository
  - if none fit, generate a local scenario inside the adventure tied to that selected or local world
- character:
  - prefer characters that belong to the selected world repository and fit the scenario
  - if none fit, propose 3 distinct protagonist options derived from the character card model and create the selected one
- adventure:
  - create one playthrough instance from the selected world, scenario, and protagonist following `products/rpg-engine/assets/workspace_templates/adventure_structure.md`
  - prepare:
    - `products/rpg-engine/workspaces/adventure/<slug>/adventure.md`
    - optional `products/rpg-engine/workspaces/adventure/<slug>/rules/adventure_rules.md`
    - optional local `products/rpg-engine/workspaces/adventure/<slug>/world.md`
    - optional local `products/rpg-engine/workspaces/adventure/<slug>/scenario.md`
    - `products/rpg-engine/workspaces/adventure/<slug>/current_scene.md`
    - `products/rpg-engine/workspaces/adventure/<slug>/state.yaml`
    - `products/rpg-engine/workspaces/adventure/<slug>/facts.yaml`
    - `products/rpg-engine/workspaces/adventure/<slug>/flags.yaml`
    - `products/rpg-engine/workspaces/adventure/<slug>/events/<id>.md`
    - `products/rpg-engine/workspaces/adventure/<slug>/sessions/<id>.md`
    - local support cards under `locations/`, `quests/`, `characters/`, `factions/`, `species/` when needed

# Constraints

- do not force the user into `master` when their intent is to begin playing now
- do not redesign world canon beyond what is needed for an immediately playable setup
- do not store bootstrap phase flags in engine runtime
- do not store full canon or full adventure state in product runtime
- do not violate the default locality rule from `products/rpg-engine/rules/data_rules.md`
- do not enter live play before a world, scenario, protagonist, and opening situation are all established
- do not create `rules/adventure_rules.md` unless the run actually needs explicit local constraints
- when bootstrap content mentions an entity that already has a known separate card, link that mention to the card

# Output

1. selected or created play inputs
2. created or updated adventure bootstrap content
3. opening situation that can continue directly in `@play`
