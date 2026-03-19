---
name: master-bootstrap-adventure
description: Create a playable adventure instance from a world, scenario, and selected protagonist.
---

# Purpose

Create an adventure workspace that acts as a concrete playthrough state container.

# Read before acting

- `AGENTS.md`
- `state/runtime.yaml`
- `.agents/rules/engine_rules.md`
- `.agents/rules/product_rules.md`
- `.agents/rules/skill_rules.md`
- `products/rpg-engine/product.yaml`
- `products/rpg-engine/modes/master.yaml`

# Behavior

1. Confirm the selected world, scenario, and protagonist character.
2. Define the adventure starting state, opening scene, known facts, active goals, and tracking expectations.
3. Create or update an `adventure` workspace under `products/rpg-engine/workspaces/`.
4. Treat the adventure as a playthrough instance rather than canon for the whole world.
5. Prepare the output so `play` mode can continue it cleanly.

# Constraints

- do not redefine world or scenario canon inside the adventure
- do not merge multiple protagonists unless explicitly requested
- do not present setup state as if it were already played history

# Output

1. created or updated adventure workspace content
2. summary of the starting situation
3. next recommended step for `@play`
