# Play Rules

## Play boundary

- `play` mode may bootstrap a new adventure for the player before live play begins
- `play` mode advances only one `adventure` at a time
- live play updates the selected adventure workspace
- scene is the core execution unit of `play`; every turn belongs to one active scene instance
- live play must respect established world rules, scenario pressure, and character capabilities
- live play must also respect any relevant local rule files under `products/rpg-engine/rules/workspace/` when they exist
- these local rule files may define behavior, constraints, tone, taboos, environmental laws, item logic, NPC conduct, or other scoped play modifiers for the active run

## Read and write behavior

- `play` may read world, scenario, and character context
- `play` may create a new adventure instance and any missing player-facing setup needed to enter play
- apply the default locality rule from `products/rpg-engine/rules/data_rules.md`
- `play` may write only to adventure state unless the user explicitly asks for authoring work outside live play
- `play` may instantiate scene definitions into mutable scene instances inside the active `adventure`
- `play` may dynamically generate a new scene definition during play when no prepared world- or scenario-owned scene fits the current situation, but that generated definition must still be written into the adventure before or at the same time as the first scene instance that uses it
- such dynamically generated scene definitions are local run artifacts rather than broader canon until explicitly promoted by `master`
- `play` may generate temporary images into `products/rpg-engine/tmp/`
- `play` may save approved images only into the active adventure scope unless the user explicitly switches to broader authoring intent
- when relevant files exist, `play` should read `rules/workspace/global.md` plus scoped local rule files for the active world, adventure, scenario, character, location, quest, faction, species, item, or other product-defined entity involved in the current scene
- if one of these optional rule files is absent, continue without treating that absence as an error
- `ref` is read-only
- `master` is the mode for canon creation and revision

## Continuity

- when starting a new game, `play` may guide selection or creation of world, scenario, and protagonist inputs
- when resuming play, use product runtime to locate the active adventure and related entity pointers
- use the adventure workspace as the source of truth for scene-instance state, scene stack, progress, consequences, and session history
- during play, new local locations, quests, characters, factions, species, and similar entities may be introduced inside the active adventure when they are relevant to the current run
- apply the default locality rule from `products/rpg-engine/rules/data_rules.md`
- treat scoped local rule files as active guardrails for interpretation and resolution during play, not as passive editorial notes
- apply only the scoped local rules that are relevant to the current run and current scene; do not silently treat one entity's local rule file as universal world canon
- keep reusable scene definitions immutable during live execution unless the user explicitly switches to authoring intent
- `master` owns reusable canonical scene-definition authoring for world and scenario scope, but `play` may still create local adventure scene definitions as part of live resolution when needed
- a reusable scene definition should describe scene purpose, framing, rules, inputs, parameters, completion conditions, result contract, transition guidance, and the templates for its mutable `state.yaml` and `log.md`
- those scene templates should extend a shared scene-engine skeleton while remaining free to add scene-specific state and log sections for the concrete mechanic
- do not store global invocation triggers inside reusable scene definitions; the caller scene or owning context decides when to invoke a scene
- every scenario used in play must resolve its opening-scene policy before scene execution begins
- before the opening scene starts, `play` should present the selected scenario's short player-facing introduction so the player understands the world tone, the scenario frame, and what kind of experience is beginning
- this introduction belongs to the scenario-entry boundary and should be shown exactly once for that scenario entry, not repeated on later questions inside the opening scene or on later scene turns unless the user explicitly asks for a recap
- every adventure used in play must resolve its starting scenario before the opening scene is instantiated
- support both:
  - chained scene transitions, where one completed scene points to the next scene definition to instantiate
  - nested scenes, where an active parent scene pauses while a child scene instance runs and later returns control
- keep enough structured state to resume any interrupted multi-step scene without relying on transient model memory
