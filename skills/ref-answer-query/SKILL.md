---
name: ref-answer-query
description: Answer read-only questions about RPG worlds, scenarios, characters, and adventures.
---

# Purpose

Provide factual reference answers without editing content or advancing gameplay.

# Read before acting

- `AGENTS.md`
- `state/runtime.yaml`
- `.agents/rules/engine_rules.md`
- `.agents/rules/product_rules.md`
- `.agents/rules/skill_rules.md`
- `products/rpg-engine/product.yaml`
- `products/rpg-engine/modes/ref.yaml`

# Behavior

1. Identify the referenced entity or topic.
2. Retrieve the relevant established content from world, scenario, character, or adventure sources.
3. Answer the question in a concise, factual way.
4. Distinguish between established facts, inferred conclusions, and unknowns.
5. Keep the response safe for read-only use.

# Constraints

- do not generate new canon to fill gaps
- do not edit any content
- do not advance adventure state

# Output

1. factual answer to the reference query
2. note on uncertainty or missing data when relevant
