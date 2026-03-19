# Play Rules

## Play boundary

- `play` mode may bootstrap a new adventure for the player before live play begins
- `play` mode advances only one `adventure` at a time
- live play updates the selected adventure workspace
- live play must respect established world rules, scenario pressure, and character capabilities

## Read and write behavior

- `play` may read world, scenario, and character context
- `play` may create a new adventure instance and any missing player-facing setup needed to enter play
- apply the default locality rule from `products/rpg-engine/rules/data_rules.md`
- `play` may write only to adventure state unless the user explicitly asks for authoring work outside live play
- `play` may generate temporary images into `products/rpg-engine/tmp/`
- `play` may save approved images only into the active adventure scope unless the user explicitly switches to broader authoring intent
- `ref` is read-only
- `master` is the mode for canon creation and revision

## Continuity

- when starting a new game, `play` may guide selection or creation of world, scenario, and protagonist inputs
- when resuming play, use product runtime to locate the active adventure and related entity pointers
- use the adventure workspace as the source of truth for scene state, progress, consequences, and session history
- during play, new local locations, quests, characters, factions, species, and similar entities may be introduced inside the active adventure when they are relevant to the current run
- apply the default locality rule from `products/rpg-engine/rules/data_rules.md`
