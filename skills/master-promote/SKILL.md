---
name: master-promote
description: Promote local adventure or scenario entities into broader canon scopes while preserving continuity.
---

# Purpose

Move a locally scoped entity into a broader canonical scope such as a world-owned scenario, a world-owned character, or world canon itself.

# Read before acting

- `AGENTS.md`
- `state/runtime.yaml`
- `.agents/rules/engine_rules.md`
- `.agents/rules/product_rules.md`
- `.agents/rules/skill_rules.md`
- `products/rpg-engine/AGENTS.md`
- `products/rpg-engine/product.yaml`
- `products/rpg-engine/modes/master.yaml`
- `products/rpg-engine/rules/data_rules.md`
- `products/rpg-engine/rules/canon_rules.md`

# Behavior

1. Identify the source entity, its current scope, and the requested target scope.
2. Read the source card and any directly related local support cards.
3. Confirm the target scope is valid under the default locality and promotion rules.
4. Create or update the target canonical file path for the promoted entity.
5. Initialize the target world repository when promotion creates a new global world for the first time.
6. Preserve continuity by noting the origin of the promotion and resolving naming or canon conflicts explicitly.
7. After a successful promotion, remove the source primary card from its original local scope by default.
8. Update any affected references in the originating adventure or scenario as needed.
9. Keep the promoted content readable as a primary card in its new scope.

# Supported promotions

- `adventure/world -> world`
- `adventure/scenario -> world/scenario`
- `adventure/character -> world/character`
- `adventure/location -> scenario/location`
- `adventure/location -> world/location`
- `adventure/quest -> scenario/quest`
- `adventure/faction -> scenario/faction`
- `adventure/faction -> world/faction`
- `adventure/specie -> scenario/specie`
- `adventure/specie -> world/specie`
- `adventure/fact -> scenario/fact`
- `adventure/fact -> world/fact`
- `scenario/character -> world/character`
- `scenario/location -> world/location`
- `scenario/faction -> world/faction`
- `scenario/specie -> world/specie`
- `scenario/fact -> world/fact`

Typical entity types:

- `world`
- `scenario`
- `character`
- `location`
- `quest`
- `faction`
- `species`
- `fact`

# File path targets

- promoted global world:
  - `products/rpg-engine/workspaces/world/<slug>/world.md`
- promoted global scenario:
  - `products/rpg-engine/workspaces/world/<world_slug>/scenarios/<scenario_slug>/scenario.md`
- promoted global character:
  - `products/rpg-engine/workspaces/world/<world_slug>/characters/<character_slug>.md`
- promoted support cards into world scope:
  - `products/rpg-engine/workspaces/world/<world_slug>/locations/<slug>.md`
  - `products/rpg-engine/workspaces/world/<world_slug>/characters/<slug>.md`
  - `products/rpg-engine/workspaces/world/<world_slug>/factions/<slug>.md`
  - `products/rpg-engine/workspaces/world/<world_slug>/species/<slug>.md`
- promoted support cards into scenario scope:
  - `products/rpg-engine/workspaces/world/<world_slug>/scenarios/<scenario_slug>/quests/<slug>.md`
  - `products/rpg-engine/workspaces/world/<world_slug>/scenarios/<scenario_slug>/locations/<slug>.md`
  - `products/rpg-engine/workspaces/world/<world_slug>/scenarios/<scenario_slug>/characters/<slug>.md`

# Fact promotion

- do not promote an entire `facts.yaml` file upward as one opaque blob
- promote facts one by one as explicit canonical statements
- first classify each fact before promoting it:
  - world law or metaphysical rule
  - world taxonomy or cosmology
  - world social order or durable historical truth
  - scenario-specific truth or pressure
  - run-local discovery that should remain only in the originating adventure
- if a fact is world-level canon, write it into the appropriate world file such as:
  - `world.md`
  - `rules_of_world.md`
  - `setting.md`
  - `factions/<slug>.md`
  - `species/<slug>.md`
- if a fact is scenario-level canon, write it into the appropriate world-owned scenario file such as:
  - `scenario.md`
  - `global_story.md`
  - `quests/<slug>.md`
  - `locations/<slug>.md`
  - `characters/<slug>.md`
- if a fact is only meaningful as run memory, keep it only in the originating `adventure/facts.yaml`
- when a fact is promoted, keep the local fact in `adventure/facts.yaml` by default unless the user explicitly wants that run-memory entry removed
- after promotion, rewrite the destination file so the fact reads naturally in canonical prose rather than as a dumped adventure note

# Source cleanup

- default promotion semantics are `move`, not `copy`
- when a primary card is promoted successfully, delete the original source card from the narrower scope
- when a support card is promoted as a canonical replacement, delete the original source card from the narrower scope
- if the user explicitly wants to keep a local variant, treat that as an exception and preserve the source card as a separate local version
- never delete `events/`, `sessions/`, `facts.yaml`, `flags.yaml`, or other run-history artifacts from the originating adventure
- keep or rewrite local references as needed so the originating adventure or scenario still reads coherently after promotion

# Constraints

- do not silently promote local entities
- do not lose the meaning of the source entity during promotion
- do not overwrite broader canon without resolving conflicts explicitly
- do not use promotion to advance live play state
- do not leave duplicate source cards behind unless the user explicitly wants parallel local and global variants
- do not treat promoted facts as raw YAML transport; integrate them into readable canonical files

# Output

1. promoted entity in its new scope
2. note on source, target, and continuity impacts
3. any follow-up edits needed in related canon or in the originating adventure
