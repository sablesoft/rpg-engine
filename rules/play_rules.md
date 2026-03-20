# Play Rules

## Play boundary

- `play` mode may bootstrap a new adventure for the player before live play begins
- `play` mode advances only one `adventure` at a time
- live play updates the selected adventure workspace
- live play must respect established world rules, scenario pressure, and character capabilities
- live play must also respect any relevant local rule files under `products/rpg-engine/rules/workspace/` when they exist
- these local rule files may define behavior, constraints, tone, taboos, environmental laws, item logic, NPC conduct, or other scoped play modifiers for the active run

## Read and write behavior

- `play` may read world, scenario, and character context
- `play` may create a new adventure instance and any missing player-facing setup needed to enter play
- apply the default locality rule from `products/rpg-engine/rules/data_rules.md`
- `play` may write only to adventure state unless the user explicitly asks for authoring work outside live play
- `play` may generate temporary images into `products/rpg-engine/tmp/`
- `play` may save approved images only into the active adventure scope unless the user explicitly switches to broader authoring intent
- when relevant files exist, `play` should read `rules/workspace/global.md` plus scoped local rule files for the active world, adventure, scenario, character, location, quest, faction, species, item, or other product-defined entity involved in the current scene
- if one of these optional rule files is absent, continue without treating that absence as an error
- `ref` is read-only
- `master` is the mode for canon creation and revision

## Continuity

- when starting a new game, `play` may guide selection or creation of world, scenario, and protagonist inputs
- when resuming play, use product runtime to locate the active adventure and related entity pointers
- use the adventure workspace as the source of truth for scene state, progress, consequences, and session history
- during play, new local locations, quests, characters, factions, species, and similar entities may be introduced inside the active adventure when they are relevant to the current run
- apply the default locality rule from `products/rpg-engine/rules/data_rules.md`
- treat scoped local rule files as active guardrails for interpretation and resolution during play, not as passive editorial notes
- apply only the scoped local rules that are relevant to the current run and current scene; do not silently treat one entity's local rule file as universal world canon
