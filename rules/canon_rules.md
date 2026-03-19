# Canon Rules

## Canon hierarchy

- global `world` workspaces define shared canon, setting rules, history, factions, and physical or metaphysical laws
- global `scenario` workspaces depend on one global `world` and must not redefine world canon
- `character` depends on one `world` and must remain compatible with world canon
- `adventure` depends on selected world, scenario, and protagonist context

## Local bootstrap canon

- apply the default locality rule from `products/rpg-engine/rules/data_rules.md`
- an `adventure` may contain local `world` and `scenario` cards when those were first generated during play bootstrap
- if those local cards are promoted later, the promoted workspace becomes the new global canonical form

## Scoped entities

- locations are normally world-scoped, but adventures may introduce local location cards for temporary or newly discovered places
- quests are normally scenario-scoped, but adventures may introduce local quest cards for run-specific goals
- characters are normally world-scoped, but scenarios and adventures may hold local character cards for scoped variants, temporary roles, or newly introduced actors
- factions and species may also exist as local scoped entities before they are established more globally
- scoped local entities follow the default locality rule from `products/rpg-engine/rules/data_rules.md`

## Canon boundaries

- treat `world`, `scenario`, and `character` as canon-bearing workspaces
- treat `adventure` as state for one concrete playthrough, not as global canon for the whole world
- apply the default locality rule from `products/rpg-engine/rules/data_rules.md`
- facts discovered during one adventure do not automatically rewrite world canon unless the product workflow explicitly promotes them

## Consistency rule

- when canon-bearing entities conflict, resolve the conflict explicitly instead of silently merging incompatible assumptions
