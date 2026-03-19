---
name: master-bootstrap-scenario
description: Create a scenario or campaign inside an existing RPG world.
---

# Purpose

Create a scenario workspace tied to one world, with plot structure, stakes, factions, and playable progression.

# Read before acting

- `AGENTS.md`
- `state/runtime.yaml`
- `.agents/rules/engine_rules.md`
- `.agents/rules/product_rules.md`
- `.agents/rules/skill_rules.md`
- `products/rpg-engine/product.yaml`
- `products/rpg-engine/modes/master.yaml`

# Behavior

1. Confirm the target world context.
2. Define the scenario premise, stakes, conflicts, major actors, locations, acts, and likely outcomes.
3. Create or update a `scenario` workspace under `products/rpg-engine/workspaces/`.
4. Ensure the scenario depends on world canon instead of redefining it.
5. Keep enough structure for later adventure setup and play.

# Constraints

- do not overwrite world canon with scenario-local assumptions
- do not treat one scenario as the whole world history
- do not advance an existing adventure during scenario design

# Output

1. created or updated scenario workspace content
2. summary of the playable scenario structure
3. next recommended step for character or adventure setup
