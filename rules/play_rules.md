# Play Rules

## Play boundary

- `play` mode advances only one `adventure` at a time
- live play updates the selected adventure workspace
- live play must respect established world rules, scenario pressure, and character capabilities

## Read and write behavior

- `play` may read world, scenario, and character context
- `play` may write only to adventure state unless the user explicitly asks for authoring work outside live play
- `ref` is read-only
- `master` is the mode for canon creation and revision

## Continuity

- when resuming play, use product runtime to locate the active adventure and related entity pointers
- use the adventure workspace as the source of truth for scene state, progress, consequences, and session history
