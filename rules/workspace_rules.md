# Workspace Rules

## Purpose

Define how `rpg-engine` uses `rules/workspace/` for all-workspace defaults and for local rule files tied to concrete product scopes.

## Scope

- all-workspace global rules are optional
- workspace-local rules are optional
- all-workspace global rules apply to every workspace inside `rpg-engine`
- workspace-local rules apply only to one concrete workspace instance
- all-workspace global rules may exist at:
  - `products/rpg-engine/rules/workspace/global.md`
- workspace-local rules may exist for:
  - `products/rpg-engine/rules/workspace/world/<slug>.md`
  - `products/rpg-engine/rules/workspace/adventure/<slug>.md`
  - `products/rpg-engine/rules/workspace/scenario/<slug>.md`
  - `products/rpg-engine/rules/workspace/scene/<slug>.md`
  - `products/rpg-engine/rules/workspace/character/<slug>.md`
  - `products/rpg-engine/rules/workspace/location/<slug>.md`
  - `products/rpg-engine/rules/workspace/quest/<slug>.md`
  - `products/rpg-engine/rules/workspace/faction/<slug>.md`
  - `products/rpg-engine/rules/workspace/species/<slug>.md`
- if any optional rule file is absent, that layer simply contributes no additional rules
- do not treat a missing optional rule file as a broken workspace or product state

## Ownership

- `products/rpg-engine/rules/workspace/global.md` defines defaults for every workspace in `rpg-engine`
- `products/rpg-engine/rules/workspace/world/<slug>.md` defines local canon, tone, metaphysical limits, taboos, or scope-specific constraints for one concrete `world`
- `products/rpg-engine/rules/workspace/adventure/<slug>.md` defines local run constraints, safety boundaries, continuity locks, scene-handling constraints, or other play limits for one concrete `adventure`
- other files under `products/rpg-engine/rules/workspace/<scope_type>/<slug>.md` may define local rules for one concrete scenario, scene, character, quest, location, faction, species, or other product-local scope
- workspace-local rules complement workspace cards; they do not replace `world.md` or `adventure.md` as the main readable source of truth

## Reading order

- always apply engine rules first
- then apply product-wide `rpg-engine` rules
- then apply all-workspace global rules when present
- then apply workspace-local rules for the concrete world or adventure when present
- then apply any more specific scoped rule files that are relevant to the current task or current scene
- if one of these optional layers is absent, skip it and continue with the remaining layers
- if a local rule conflicts with a product-wide or engine-wide rule, prefer the broader invariant and surface the conflict explicitly

## Rule transfer

- `rpg-engine` may promote a local workspace rule into `products/rpg-engine/rules/workspace/global.md` when it truly belongs to every workspace
- `rpg-engine` may localize an all-workspace global rule into `products/rpg-engine/rules/workspace/world/<slug>.md`
- `rpg-engine` may localize an all-workspace global rule into `products/rpg-engine/rules/workspace/adventure/<slug>.md`
- `master-promote` owns this transfer workflow unless a future dedicated rule-governance workflow becomes materially more complex

## File convention

- a `world` workspace should use `products/rpg-engine/rules/workspace/world/<slug>.md` as its primary local rule file
- an `adventure` workspace should use `products/rpg-engine/rules/workspace/adventure/<slug>.md` as its primary local rule file
- other product scopes may use `products/rpg-engine/rules/workspace/<scope_type>/<slug>.md` when explicit local rule form is justified
- additional files may be added later when one file becomes unwieldy, but start simple

## Constraints

- do not store runtime pointers or mutable turn state in workspace-local rules
- do not store runtime pointers or mutable turn state in all-workspace global rules
- do not move global product behavior into one workspace
- do not let `rules/workspace/global.md` become a duplicate of `product_rules.md`; keep only workspace-facing defaults there
- do not duplicate full card content into local rules when a card section can carry the canon more clearly
- do not use workspace-local rules to silently override established canon without updating the affected cards

## Principle

Workspace-local rules are local guardrails, not a second runtime.
In `play`, relevant scoped local rules also act as live behavior constraints for narration and consequence resolution.
