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
- reusable `scene` definitions use a scene card
- `character` uses a character card
- `adventure` uses an adventure card
- image-owning or image-participating entities may include a `Visual Concept` section when visual continuity matters
- a `Visual Concept` section should describe stable visual identity rather than one transient scene state
- card-facing section headers should follow `content_language`; engine-language headers may still appear in support metadata files
- the source of truth for workspace-facing card labels is `products/rpg-engine/assets/workspace_dictionary/`
- commit only `*.template.yaml` dictionary files in that directory
- when `content_language` is not `en`, create local translation files under a language subdirectory such as `workspace_dictionary/ru/` and update those instead of hard-coding labels into scripts or templates
- card templates must distinguish required and optional top-level sections
- required sections must always be present in generated and refactored cards
- optional sections may be omitted when unknown, empty, or intentionally deferred
- subsections may be nested under any main section when that improves readability
- `Description` is the shared generic descriptive section across card types; do not introduce new top-level `Summary` sections in workspace cards
- validate workspace cards against their templates after structural template changes

## Entity naming uniqueness

- names of established entities must be unique within one `world` context, including that world's own content plus its world-owned scenarios, characters, and any adventure-local entities that belong to adventures in that same world
- do not create two different entities with the same visible title even when their scope, type, or file path differs
- when two entities are conceptually close enough that they might naturally share a base name, add an epithet, qualifier, or other explicit differentiator so the final visible names remain unambiguous
- prefer disambiguation in the title itself rather than relying on surrounding prose, folder placement, or slug differences
- apply this rule to core entities and support entities alike, including worlds, scenarios, adventures, characters, locations, quests, factions, species, items, and similar named content
- different worlds may reuse the same visible title when those entities do not belong to the same world context
- when promoting, refactoring, or expanding canon reveals a naming collision, resolve it explicitly as part of the same editing pass rather than leaving duplicate visible names in place

## Card cross-reference rule

- when one workspace card mentions an entity that already has its own separate card, that mention should be a Markdown link to the corresponding card whenever the target card path is known
- this applies to mentions inside prose, lists, field values, relationship sections, and similar card content, not only to dedicated placement fields
- prefer linking the existing card rather than repeating the same entity as plain text nearby
- do not add a self-link to the title of the current card just because that card is itself the referenced entity
- if the entity does not have its own card yet or the target path is still unknown, plain text is allowed temporarily
- when a separate card is later created or resolved, update relevant mentions to links as part of the same editing pass when practical

## Top-level repository rule

- only `world` and `adventure` are top-level workspace repositories
- every global `scenario` belongs to one `world` repository
- every global `character` belongs to one `world` repository
- every reusable `scene` definition belongs either to one `world` repository directly or to one world-owned `scenario`
- every `adventure` belongs to one world context and may contain local cards for any entity first created during play

## Global vs local entity form

- a core entity may exist either as:
  - a global entity inside a `world` repository
  - a local card nested inside an `adventure`
- see the default locality rule
- only explicitly promoted entities become global content in a `world` repository or, for worlds themselves, standalone `world` repositories

## Workspace file convention

- `world` workspace live under `products/rpg-engine/workspace/world/<slug>/`
- `adventure` workspace live under `products/rpg-engine/workspace/adventure/<slug>/`

- each `world` workspace uses:
  - `world.md` as the primary card
  - optional local rules file:
    - `products/rpg-engine/rules/workspace/world/<slug>.md`
  - optional support files such as `setting.md`, `rules_of_world.md`, `global_story.md`, `tone_and_themes.md`
  - optional scope-local image root:
    - `images/`
  - world-owned folders such as:
    - `locations/`
    - `characters/`
    - `factions/`
    - `species/`
    - `scenes/`
    - `scenarios/`

- each reusable world-owned scene definition uses:
  - `products/rpg-engine/workspace/world/<world_slug>/scenes/<scene_slug>/scene.md`
  - optional support files such as:
    - `state_template.yaml`
    - `log_template.md`
    - `mechanics.md`
    - `examples.md`

- each global scenario inside a world uses:
  - `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/scenario.md`
  - optional support files such as `global_story.md` and `tone_and_themes.md`
  - optional scope-local image root:
    - `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/images/`
  - support-card folders such as `quests/`, `locations/`, `characters/`

- each reusable scenario-owned scene definition uses:
  - `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/scenes/<scene_slug>/scene.md`
  - optional support files such as:
    - `state_template.yaml`
    - `log_template.md`
    - `mechanics.md`
    - `examples.md`
- each reusable scene definition should provide scene-specific `state_template.yaml` and `log_template.md` built on top of a shared scene-engine skeleton rather than reusing one rigid static template unchanged for every scene

- each global character inside a world uses:
  - `products/rpg-engine/workspace/world/<world_slug>/characters/<character_slug>.md`

- each `adventure` workspace uses:
  - `adventure.md` as the primary card
  - optional local rules file:
    - `products/rpg-engine/rules/workspace/adventure/<slug>.md`
  - optional local `world.md` and `scenario.md` when those entities were first created inside the adventure
  - optional local protagonist card such as `characters/player.md`
  - `current_scene.md` for the immediate playable scene
  - `scene_state.yaml` for the current active scene-instance pointer, stack, and resumable execution state
  - `state.yaml`, `facts.yaml`, and `flags.yaml` for mutable run state
  - `scenes/` for mutable scene instances created or executed during the run
  - `events/` and `sessions/` for play history
  - optional scope-local image root:
    - `images/`
  - support-card folders such as `locations/`, `quests/`, `characters/`, `factions/`, `species/`

- each scene instance inside an adventure uses:
  - adventure-local scene definitions:
    - `products/rpg-engine/workspace/adventure/<adventure_slug>/scenes/definitions/<scene_slug>/scene.md`
    - optional support files such as:
      - `state_template.yaml`
      - `log_template.md`
      - `mechanics.md`
  - `products/rpg-engine/workspace/adventure/<adventure_slug>/scenes/<scene_instance_id>/scene.md`
  - `products/rpg-engine/workspace/adventure/<adventure_slug>/scenes/<scene_instance_id>/state.yaml`
  - optional `products/rpg-engine/workspace/adventure/<adventure_slug>/scenes/<scene_instance_id>/log.md`
- a scene instance may execute:
  - a reusable scene definition from world scope
  - a reusable scene definition from scenario scope
  - a dynamically generated adventure-local scene definition that is still explicitly bound to the active world or active scenario context
- do not execute a mutable scene instance without a stable scene definition artifact to anchor its rules and semantics
- keep a shared core scene-state skeleton across all scenes, but allow scene-specific template extensions for combat, questionnaires, rituals, negotiations, and other specialized scene needs

## Repository ownership

- each `world` workspace may be initialized as its own git repository
- each `adventure` workspace may be initialized as its own git repository
- the product repository should ignore concrete workspace content so engine evolution stays independent from world and adventure content

## Support-card ownership

- `location` cards are world-level by default, but may exist as local cards inside an `adventure`
- a `location` card may represent a place nested inside a larger location; use an explicit location-placement field in the card rather than overloading scope fields for that relationship
- when the parent chain is known, store the full known upward chain in order from immediate parent to larger containing locations
- each item in that location-placement chain should include both the parent location name and its kind
- when the target card path is known, each item in that chain should use a Markdown link to the corresponding location or world card
- `quest` cards are scenario-level by default, but may exist as local cards inside an `adventure`
- reusable `scene` definitions are world-level or scenario-level by default; they are not top-level repositories and they are not mutable play-state artifacts
- `play` may also create adventure-local scene definitions during live play when needed, but those remain local run artifacts until explicitly promoted
- `character` cards are world-level by default, but may exist as local cards inside a world-owned `scenario` or an `adventure`
- `faction` and `species` cards may exist at world, scenario, or adventure scope depending on where they are established
- image assets always belong to one concrete owner entity and live in that entity's scope-local `images/` subtree
- image metadata cards are support artifacts and must not replace the owner primary card as the main readable entry point
- visual concept notes belong to the entity cards themselves, not to runtime

## Play-first locality

- see the default locality rule

## Promotion

- see the default locality rule
- local support cards may be promoted to a more global scope through `master` workflows when the user asks for it
- adventure-local reusable scene definitions may be promoted into scenario or world scope through `master` workflows when the user asks for it
- local `world` cards may be promoted into standalone `world` repositories through `master` workflows when the user asks for it
- local `scenario` and `character` cards may be promoted into a target `world` repository through `master` workflows when the user asks for it
- promotion may move an entity from `adventure` to `scenario` or `world`, or from a world-owned `scenario` to the wider world scope, depending on the requested target scope
- image assets may move upward only under the promotion constraints defined in `products/rpg-engine/rules/image_rules.md`
- promotion must preserve meaning and resolve naming or canon conflicts explicitly
- do not silently promote local adventure discoveries into world canon

## Style

- keep cards compact, readable, and directly usable in play or reference
- prefer clear sections over heavy schema complexity
- do not turn product data into engine-language metadata dumps
- keep `Visual Concept` sections reusable and durable rather than locked to one momentary pose, wound, or outfit variation unless that variation is itself canonically stable
- keep workspace-local rules short, explicit, and scoped to constraints that are awkward to express cleanly inside the primary card
- keep reusable scene definitions stable and canonical; keep mutable iteration state, pending choices, and execution logs in scene instances rather than rewriting the definition during play
- every scenario should define its opening-scene policy as one of:
  - one prepared opening scene
  - a small prepared choice set of opening scenes
  - dynamic opening-scene generation guidance
- every adventure must resolve its starting scenario before entering live play; that starting scenario may be preselected, dynamically created, or chosen from a small compatible set
