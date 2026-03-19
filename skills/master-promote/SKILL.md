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
7. Update any affected references in the originating adventure as needed.
8. Keep the promoted content readable as a primary card in its new scope.

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
- `scenario/character -> world/character`
- `scenario/location -> world/location`
- `scenario/faction -> world/faction`
- `scenario/specie -> world/specie`

Typical entity types:

- `world`
- `scenario`
- `character`
- `location`
- `quest`
- `faction`
- `species`

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

# Constraints

- do not silently promote local entities
- do not lose the meaning of the source entity during promotion
- do not overwrite broader canon without resolving conflicts explicitly
- do not use promotion to advance live play state

# Output

1. promoted entity in its new scope
2. note on source, target, and continuity impacts
3. any follow-up edits needed in related canon or in the originating adventure
