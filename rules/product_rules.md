# RPG Engine Rules

## Purpose

Define product-level invariants, domain boundaries, and workflow constraints for `rpg-engine`.

## Rules

- treat `world` and `adventure` as the only top-level workspace repositories
- treat global `scenario` and global `character` content as world-owned content, not as top-level workspace
- use product runtime only for resumable local context
- use workspace as the source of truth for RPG canon and play state
- keep product-wide mode boundaries consistent across all product-local skills
- keep product-local file-link behavior mode-scoped and workspace-scoped
- each core workspace should have one primary card written in `content_language`
- keep product data templates simple and readable before adding secondary support files
- keep product-local engine files independent from concrete world and adventure content
- use `rules/workspace/global.md` for defaults shared by every workspace regardless of type
- use `rules/workspace/<workspace_type>/<slug>.md` for rules that apply only to one concrete workspace
- use `rules/workspace/<scope_type>/<slug>.md` more generally for any local working rules tied to one concrete product scope such as a scenario, character, quest, location, faction, or species
- if any optional workspace-rule file is absent, treat that scope as having no extra rules
- keep inter-card references explicit with Markdown links when the referenced entity already has its own card
- keep workspace-facing labels in the workspace dictionary flow rather than hard-coding them in scripts or templates
- keep shared labels in `workspace_dictionary/sections*`
- keep labels unique to one entity or document type in dictionary files for that entity or document type
- commit only `*.template.yaml` dictionary files; keep concrete non-English or user-adjusted realizations local and ignored by git
- when card templates are created or refactored, update the matching dictionary files in the same change

## File link policy

- in `master`, terminal file links may point only to existing files under `products/rpg-engine/workspace/`
- in `master`, prefer terminal-first OSC 8 file links when a workspace artifact should be inspected
- in `master`, do not emit product-file links for files outside `products/rpg-engine/workspace/`
- in `play`, file links must be limited to image artifacts under `products/rpg-engine/workspace/`
- in `play`, do not emit direct links to full cards or other non-image workspace files
- in `ref`, file links must be limited to image artifacts under `products/rpg-engine/workspace/`
- in `ref`, do not emit direct links to full cards or other non-image workspace files
- if a requested non-image artifact would violate the current mode boundary, summarize or quote the needed information instead of linking the file

## Constraints

- do not override engine root invariants
- do not store world canon or adventure history in product runtime
- do not treat one workspace instance as the contract for the whole product
- do not require the product repo to track world or adventure content
- do not let one workspace's local rules masquerade as global `rpg-engine` rules
- do not let `rules/workspace/global.md` become a dumping ground for general product policy that belongs in `product_rules.md`

## Principle

Product rules govern RPG domain behavior.  
Workspaces store RPG truth.
