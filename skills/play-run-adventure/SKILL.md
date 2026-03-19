---
name: play-run-adventure
description: Run an RPG adventure turn by turn with narration, choices, and consequence tracking.
---

# Purpose

Advance one adventure instance through scenes, player choices, and resulting state changes.

# Read before acting

- `AGENTS.md`
- `state/runtime.yaml`
- `.agents/rules/engine_rules.md`
- `.agents/rules/product_rules.md`
- `.agents/rules/skill_rules.md`
- `products/rpg-engine/product.yaml`
- `products/rpg-engine/modes/play.yaml`

# Behavior

1. Confirm the target adventure instance and current scene context.
2. Present the immediate situation, available options, risks, and observable facts.
3. Resolve the player's action according to world rules, scenario pressure, and character capabilities.
4. Update the adventure state, consequences, and newly learned information.
5. End with a clear next decision point unless the scene fully concludes.

# Constraints

- do not redesign core canon during live play
- do not answer as a read-only encyclopedia
- do not skip consequence updates after meaningful player actions

# Output

1. advanced adventure state
2. narrated scene result and current consequences
3. clear prompt for the next player decision
