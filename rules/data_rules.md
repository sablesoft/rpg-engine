# Data Rules

## Core principle

- each core RPG entity is represented by one primary card written in `content_language`
- primary cards are the first readable source of truth for that entity
- support files may exist later, but they must not replace the primary card as the main entry point

## Default locality rule

- any entity first created during `play` or player-facing adventure bootstrap exists only inside the current `adventure` by default
- this applies to both core entities and support entities, including `world`, `scenario`, `character`, `location`, `quest`, `faction`, `species`, facts, and similar emergent content
- such entities become more global only through an explicit `master` promotion workflow
- until promotion happens, treat them as valid run content for that adventure, not as global canon

## Entity cards

- `world` uses a world card
- `scenario` uses a scenario card
- `character` uses a character card
- `adventure` uses an adventure card

## Global vs local entity form

- a core entity may exist either as:
  - a global workspace-level entity
  - a local card nested inside an `adventure`
- see the default locality rule
- only explicitly promoted entities become standalone workspace-level `world` or `scenario` entries

## Workspace file convention

- `world` workspaces live under `products/rpg-engine/workspaces/world/<slug>/`
- `scenario` workspaces live under `products/rpg-engine/workspaces/scenario/<slug>/`
- `character` workspaces live under `products/rpg-engine/workspaces/character/<slug>/`
- `adventure` workspaces live under `products/rpg-engine/workspaces/adventure/<slug>/`

- each `world` workspace uses:
  - `world.md` as the primary card
  - optional support files such as `setting.md`, `rules_of_world.md`, `global_story.md`, `tone_and_themes.md`
  - support-card folders such as `locations/`, `characters/`, `factions/`, `species/`

- each `scenario` workspace uses:
  - `scenario.md` as the primary card
  - optional support files such as `global_story.md`, `tone_and_themes.md`
  - support-card folders such as `quests/`, `locations/`, `characters/`

- each `character` workspace uses:
  - `character.md` as the primary card

- each `adventure` workspace uses:
  - `adventure.md` as the primary card
  - optional local `world.md` and `scenario.md` when those entities were first created inside the adventure
  - `current_scene.md` for the immediate playable scene
  - `state.yaml`, `facts.yaml`, and `flags.yaml` for mutable run state
  - `events/` and `sessions/` for play history
  - support-card folders such as `locations/`, `quests/`, `characters/`, `factions/`, `species/`

## Support-card ownership

- `location` cards are world-level by default, but may exist as local cards inside an `adventure`
- `quest` cards are scenario-level by default, but may exist as local cards inside an `adventure`
- `character` cards are world-level by default, but may exist as local cards inside a `scenario` or an `adventure`
- `faction` and `species` cards may exist at world, scenario, or adventure scope depending on where they are established

## Play-first locality

- see the default locality rule

## Promotion

- see the default locality rule
- local support cards may be promoted to a more global scope through `master` workflows when the user asks for it
- local `world` and `scenario` cards may be promoted into standalone global workspaces through `master` workflows when the user asks for it
- promotion may move an entity from `adventure` to `scenario` or `world`, or from `scenario` to `world`, depending on the requested target scope
- promotion must preserve meaning and resolve naming or canon conflicts explicitly
- do not silently promote local adventure discoveries into world canon

## Style

- keep cards compact, readable, and directly usable in play or reference
- prefer clear sections over heavy schema complexity
- do not turn product data into engine-language metadata dumps
