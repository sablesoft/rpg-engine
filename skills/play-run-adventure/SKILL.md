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
- `products/rpg-engine/assets/workspace_dictionary/`
- `products/rpg-engine/assets/workspace_templates/adventure_structure.md`
- `products/rpg-engine/skills/play-run-adventure/assets/current_scene_template.md`
- `products/rpg-engine/skills/play-run-adventure/assets/event_template.md`
- `products/rpg-engine/skills/play-run-adventure/assets/session_log_template.md`

# Behavior

1. Confirm the target adventure instance and current scene context.
2. If the user is clearly trying to start a new game rather than continue one, hand off to `play-bootstrap-adventure`.
3. Read and update adventure files under:
   - `products/rpg-engine/workspaces/adventure/<slug>/adventure.md`
   - `products/rpg-engine/workspaces/adventure/<slug>/current_scene.md`
   - `products/rpg-engine/workspaces/adventure/<slug>/state.yaml`
   - `products/rpg-engine/workspaces/adventure/<slug>/facts.yaml`
   - `products/rpg-engine/workspaces/adventure/<slug>/flags.yaml`
   - `products/rpg-engine/workspaces/adventure/<slug>/events/<id>.md`
   - `products/rpg-engine/workspaces/adventure/<slug>/sessions/<id>.md`
   - `products/rpg-engine/workspaces/adventure/<slug>/rules/adventure_rules.md` when present
   - local support cards under `locations/`, `quests/`, `characters/`, `factions/`, `species/` when relevant
   - local `world.md` or `scenario.md` when present, otherwise the selected global world repository and its world-owned scenario content
   - `products/rpg-engine/workspaces/world/<world_slug>/rules/world_rules.md` when that world workspace exists and defines local rules
   - skip any absent optional rule layer without treating it as an error
4. Present the immediate situation, available options, risks, and observable facts.
5. Resolve the player's action according to world rules, scenario pressure, and character capabilities.
6. Update the adventure state, consequences, and newly learned information.
7. End with a clear next decision point unless the scene fully concludes.

# Constraints

- do not redesign core canon during live play
- do not answer as a read-only encyclopedia
- do not skip consequence updates after meaningful player actions
- do not violate established workspace-local world or adventure rules
- do not fail or stall because an optional workspace rule file is absent
- when updating cards during play, link mentions of entities that already have known separate cards

# Output

1. advanced adventure state
2. narrated scene result and current consequences
3. clear prompt for the next player decision
