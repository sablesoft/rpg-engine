# Canon Rules

## Canon hierarchy

- global `world` repositories define shared canon, setting rules, history, factions, and physical or metaphysical laws
- global `scenario` content lives inside one global `world` repository and must not redefine world canon
- global `character` content lives inside one global `world` repository and must remain compatible with world canon
- `adventure` depends on selected world, scenario, and protagonist context

## Local bootstrap canon

- apply the default locality rule from `products/rpg-engine/rules/data_rules.md`
- an `adventure` may contain local `world` and `scenario` cards when those were first generated during play bootstrap
- if those local cards are promoted later, the promoted world repository or world-owned scenario becomes the new global canonical form

## Scoped entities

- locations are normally world-scoped, but adventures may introduce local location cards for temporary or newly discovered places
- quests are normally scenario-scoped, but adventures may introduce local quest cards for run-specific goals
- characters are normally world-scoped, but world-owned scenarios and adventures may hold local character cards for scoped variants, temporary roles, or newly introduced actors
- factions and species may also exist as local scoped entities before they are established more globally
- images are always scoped to one owning entity and inherit that entity's locality
- visual concepts should describe persistent or broadly reusable appearance logic for an entity, even when individual scenes may add temporary variation
- scoped local entities follow the default locality rule from `products/rpg-engine/rules/data_rules.md`

## Canon boundaries

- treat `world` repositories and world-owned `scenario` and `character` content as canon-bearing global content
- treat `adventure` as state for one concrete playthrough, not as global canon for the whole world
- apply the default locality rule from `products/rpg-engine/rules/data_rules.md`
- facts discovered during one adventure do not automatically rewrite world canon unless the product workflow explicitly promotes them
- images may illustrate canon, but they do not outrank the written source cards they are attached to
- visual concepts should be inferred from canon carefully and updated explicitly when image work reveals stable appearance details worth preserving

## Consistency rule

- when canon-bearing entities conflict, resolve the conflict explicitly instead of silently merging incompatible assumptions
