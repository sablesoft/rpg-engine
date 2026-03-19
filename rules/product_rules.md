# RPG Engine Rules

## Purpose

Define product-level invariants, domain boundaries, and workflow constraints for `rpg-engine`.

## Rules

- treat `world`, `scenario`, `character`, and `adventure` as the core workspace ontology
- use product runtime only for resumable local context
- use workspaces as the source of truth for RPG canon and play state
- keep product-wide mode boundaries consistent across all product-local skills

## Constraints

- do not override engine root invariants
- do not store world canon or adventure history in product runtime
- do not treat one workspace instance as the contract for the whole product

## Principle

Product rules govern RPG domain behavior.  
Workspaces store RPG truth.
