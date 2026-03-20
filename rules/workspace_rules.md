# Workspace Rules

## Purpose

Define how `rpg-engine` specializes the engine workspace-rules contract for `world` and `adventure`.

## Scope

- all-workspace global rules are optional
- workspace-type global rules are optional
- workspace-local rules are optional
- all-workspace global rules apply to every workspace inside `rpg-engine`
- workspace-type global rules apply to every workspace of one type inside `rpg-engine`
- workspace-local rules apply only to one concrete workspace instance
- all-workspace global rules may exist at:
  - `products/rpg-engine/rules/workspaces/global.md`
- workspace-type global rules may exist at:
  - `products/rpg-engine/rules/workspaces/world.md`
  - `products/rpg-engine/rules/workspaces/adventure.md`
- `world.md` and `adventure.md` are product-specific workspace-type rule files tied to the `rpg-engine` workspace model
- workspace-local rules may exist for:
  - `products/rpg-engine/workspaces/world/<slug>/rules/`
  - `products/rpg-engine/workspaces/adventure/<slug>/rules/`
- if any optional rule file is absent, that layer simply contributes no additional rules
- do not treat a missing optional rule file as a broken workspace or product state

## Ownership

- `products/rpg-engine/rules/workspaces/global.md` defines defaults for every workspace in `rpg-engine`
- `products/rpg-engine/rules/workspaces/world.md` defines defaults for every global `world` workspace
- `products/rpg-engine/rules/workspaces/adventure.md` defines defaults for every `adventure` workspace
- `world` workspace-local rules define local canon, tone, metaphysical limits, taboos, or scope-specific constraints for that one world
- `adventure` workspace-local rules define local run constraints, safety boundaries, continuity locks, scene-handling constraints, or other play limits for that one adventure
- workspace-local rules complement workspace cards; they do not replace `world.md` or `adventure.md` as the main readable source of truth

## Reading order

- always apply engine rules first
- then apply product-wide `rpg-engine` rules
- then apply all-workspace global rules when present
- then apply workspace-type global rules for the relevant workspace type when present
- then apply workspace-local rules for the concrete world or adventure when present
- if one of these optional layers is absent, skip it and continue with the remaining layers
- if a local rule conflicts with a product-wide or engine-wide rule, prefer the broader invariant and surface the conflict explicitly

## Rule transfer

- `rpg-engine` may promote a local workspace rule into `products/rpg-engine/rules/workspaces/global.md` when it truly belongs to every workspace
- `rpg-engine` may promote a local `world` rule into `products/rpg-engine/rules/workspaces/world.md`
- `rpg-engine` may promote a local `adventure` rule into `products/rpg-engine/rules/workspaces/adventure.md`
- `rpg-engine` may localize an all-workspace global rule back into one concrete workspace or one workspace type
- `rpg-engine` may localize a workspace-type global rule back into one concrete `world` or `adventure`
- `master-promote` owns this transfer workflow unless a future dedicated rule-governance workflow becomes materially more complex

## File convention

- a `world` workspace should use `rules/world_rules.md` as its primary local rule file
- an `adventure` workspace should use `rules/adventure_rules.md` as its primary local rule file
- additional files may be added later when one file becomes unwieldy, but start simple

## Constraints

- do not store runtime pointers or mutable turn state in workspace-local rules
- do not store runtime pointers or mutable turn state in all-workspace global rules
- do not store runtime pointers or mutable turn state in workspace-type global rules
- do not move global product behavior into one workspace
- do not let `rules/workspaces/global.md` become a duplicate of `product_rules.md`; keep only workspace-facing defaults there
- do not duplicate full card content into local rules when a card section can carry the canon more clearly
- do not use workspace-local rules to silently override established canon without updating the affected cards

## Principle

Workspace-local rules are local guardrails, not a second runtime.
