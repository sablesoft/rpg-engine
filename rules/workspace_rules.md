# Workspace Rules

## Purpose

Define how `rpg-engine` uses optional workspace-local rules for one concrete `world` or `adventure`.

## Scope

- workspace-local rules are optional
- workspace-local rules apply only to one concrete workspace instance
- workspace-local rules may exist for:
  - `products/rpg-engine/workspaces/world/<slug>/rules/`
  - `products/rpg-engine/workspaces/adventure/<slug>/rules/`

## Ownership

- `world` workspace-local rules define local canon, tone, metaphysical limits, taboos, or scope-specific constraints for that one world
- `adventure` workspace-local rules define local run constraints, safety boundaries, continuity locks, scene-handling constraints, or other play limits for that one adventure
- workspace-local rules complement workspace cards; they do not replace `world.md` or `adventure.md` as the main readable source of truth

## Reading order

- always apply engine rules first
- then apply product-wide `rpg-engine` rules
- then apply workspace-local rules for the concrete world or adventure when present
- if a local rule conflicts with a product-wide or engine-wide rule, prefer the broader invariant and surface the conflict explicitly

## File convention

- a `world` workspace should use `rules/world_rules.md` as its primary local rule file
- an `adventure` workspace should use `rules/adventure_rules.md` as its primary local rule file
- additional files may be added later when one file becomes unwieldy, but start simple

## Constraints

- do not store runtime pointers or mutable turn state in workspace-local rules
- do not move global product behavior into one workspace
- do not duplicate full card content into local rules when a card section can carry the canon more clearly
- do not use workspace-local rules to silently override established canon without updating the affected cards

## Principle

Workspace-local rules are local guardrails, not a second runtime.
