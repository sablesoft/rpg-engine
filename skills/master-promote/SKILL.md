---
name: master-promote
description: Promote local adventure or scenario entities into broader canon scopes while preserving continuity.
---

# Purpose

Move a locally scoped entity into a broader canonical scope such as a world-owned scenario, a world-owned character, world canon itself, or a broader workspace rule layer.

# Read before acting

- `AGENTS.md`
- `state/runtime.yaml`
- `.agents/rules/engine_rules.md`
- `.agents/rules/product_rules.md`
- `.agents/rules/skill_rules.md`
- `products/rpg-engine/AGENTS.md`
- `products/rpg-engine/product.yaml`
- `products/rpg-engine/modes/master.yaml`
- `products/rpg-engine/rules/data_rules.md`
- `products/rpg-engine/rules/canon_rules.md`
- `products/rpg-engine/rules/image_rules.md`
- `products/rpg-engine/rules/workspace_rules.md`

# Behavior

1. Identify the source entity, its current scope, and the requested target scope.
2. Read the source card, rule file, or any directly related local support cards.
3. Detect whether the source entity has persisted images in its scope-local `images/` subtree and whether the user asked to move them.
4. Confirm the target scope is valid under the default locality and promotion rules.
5. Create or update the target canonical file path for the promoted entity or rule destination.
6. Initialize the target world repository when promotion creates a new global world for the first time.
7. Preserve continuity by noting the origin of the promotion and resolving naming or canon conflicts explicitly.
8. If the promoted entity's visible title would collide with another distinct established entity inside the same target world context, rename or qualify it during the same promotion pass so titles remain unambiguous.
9. Move related image assets only under the image promotion rules from `products/rpg-engine/rules/image_rules.md`.
10. After a successful promotion, remove the source primary card from its original local scope by default.
11. Update any affected references in the originating adventure, scenario, world, or other directly affected scope so they point to the new canonical location or are rewritten cleanly when a direct link no longer makes sense.
12. Check for stale references to the old local path and resolve them before considering the promotion complete.
13. Keep the promoted content readable as a primary card in its new scope.

# Supported promotions

- `adventure/world -> world`
- `adventure/scenario -> world/scenario`
- `adventure/character -> world/character`
- `adventure/location -> scenario/location`
- `adventure/location -> world/location`
- `adventure/quest -> scenario/quest`
- `adventure/scene -> scenario/scene`
- `adventure/scene -> world/scene`
- `adventure/faction -> scenario/faction`
- `adventure/faction -> world/faction`
- `adventure/specie -> scenario/specie`
- `adventure/specie -> world/specie`
- `adventure/fact -> scenario/fact`
- `adventure/fact -> world/fact`
- `scenario/character -> world/character`
- `scenario/location -> world/location`
- `scenario/faction -> world/faction`
- `scenario/specie -> world/specie`
- `scenario/fact -> world/fact`
- `workspace/rule -> rules/workspace/global`
- `world/rule -> rules/workspace/world/<slug>.md`
- `adventure/rule -> rules/workspace/adventure/<slug>.md`
- `rules/workspace/global -> workspace/rule`
- `rules/workspace/world/<slug>.md -> world/rule`
- `rules/workspace/adventure/<slug>.md -> adventure/rule`

Typical entity types:

- `world`
- `scenario`
- `character`
- `location`
- `quest`
- `faction`
- `species`
- `fact`
- `image`
- `rule`

# File path targets

- promoted global world:
  - `products/rpg-engine/workspace/world/<slug>/world.md`
- promoted global scenario:
  - `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/scenario.md`
- promoted global character:
  - `products/rpg-engine/workspace/world/<world_slug>/characters/<character_slug>.md`
- promoted support cards into world scope:
  - `products/rpg-engine/workspace/world/<world_slug>/locations/<slug>.md`
  - `products/rpg-engine/workspace/world/<world_slug>/characters/<slug>.md`
  - `products/rpg-engine/workspace/world/<world_slug>/factions/<slug>.md`
  - `products/rpg-engine/workspace/world/<world_slug>/species/<slug>.md`
  - `products/rpg-engine/workspace/world/<world_slug>/scenes/<scene_slug>/scene.md`
- promoted support cards into scenario scope:
  - `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/quests/<slug>.md`
  - `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/locations/<slug>.md`
  - `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/characters/<slug>.md`
  - `products/rpg-engine/workspace/world/<world_slug>/scenarios/<scenario_slug>/scenes/<scene_slug>/scene.md`
- promoted all-workspace global rule file:
  - `products/rpg-engine/rules/workspace/global.md`
- localized workspace rules:
  - `products/rpg-engine/rules/workspace/world/<world_slug>.md`
  - `products/rpg-engine/rules/workspace/adventure/<adventure_slug>.md`

# Rule promotion and localization

- promote a workspace-local rule into `rules/workspace/global.md` when it should apply to every workspace regardless of type
- localize an all-workspace global rule when one workspace type or one concrete workspace needs an explicit narrower form
- if a broader destination rule file does not exist yet, create it as part of the promotion instead of treating that as a failure
- when promoting a rule upward, rewrite it so it no longer depends on one workspace slug, one local proper noun, or one transient run condition unless that dependency is still intended
- when localizing a broader rule downward, preserve the broader intent while narrowing the wording for that concrete workspace
- after a successful upward rule promotion, remove the local duplicate only when the new broader rule fully supersedes the local wording
- after a successful localization, keep the broader rule by default unless the user explicitly wants to stop applying it at the broader scope

# Image promotion

- image assets are never promoted as unattached global artifacts
- valid image moves are:
  - together with the owning entity during that entity's promotion
  - separately only when the owner entity already exists in the broader target scope
- when an entity promotion includes images, move:
  - the media files
  - the image metadata cards
  - the owner entity `Images` section references
- if the user asks to promote one image while leaving others behind, move only the named image package and keep the remaining local image links intact
- do not move an image into scenario or world scope if the target owner entity does not already exist there by the end of the operation

# Fact promotion

- do not promote an entire `facts.yaml` file upward as one opaque blob
- promote facts one by one as explicit canonical statements
- first classify each fact before promoting it:
  - world law or metaphysical rule
  - world taxonomy or cosmology
  - world social order or durable historical truth
  - scenario-specific truth or pressure
  - run-local discovery that should remain only in the originating adventure
- if a fact is world-level canon, write it into the appropriate world file such as:
  - `world.md`
  - `rules_of_world.md`
  - `setting.md`
  - `factions/<slug>.md`
  - `species/<slug>.md`
- if a fact is scenario-level canon, write it into the appropriate world-owned scenario file such as:
  - `scenario.md`
  - `global_story.md`
  - `quests/<slug>.md`
  - `locations/<slug>.md`
  - `characters/<slug>.md`
- if a fact is only meaningful as run memory, keep it only in the originating `adventure/facts.yaml`
- when a fact is promoted, keep the local fact in `adventure/facts.yaml` by default unless the user explicitly wants that run-memory entry removed
- after promotion, rewrite the destination file so the fact reads naturally in canonical prose rather than as a dumped adventure note

# Source cleanup

- default promotion semantics are `move`, not `copy`
- when a primary card is promoted successfully, delete the original source card from the narrower scope
- when a support card is promoted as a canonical replacement, delete the original source card from the narrower scope
- if the user explicitly wants to keep a local variant, treat that as an exception and preserve the source card as a separate local version
- never delete `events/`, `sessions/`, `facts.yaml`, `flags.yaml`, or other run-history artifacts from the originating adventure
- always update or rewrite local references as part of the same promotion pass so the originating adventure or scenario still reads coherently after promotion
- when the promoted entity moved to a new canonical path, replace old links to the former local path with links to the new path wherever that reference should remain a link
- when a former local dependency was not promoted together with the entity, rewrite the promoted card so it no longer contains misleading or broken links to narrower-scope artifacts unless that narrower dependency is still intentionally valid
- keep or rewrite affected rule references and nearby card wording as needed so the resulting scope boundaries remain clear

# Constraints

- do not use this skill to edit `rpg-engine` product contracts outside workspace content and `rules/workspace/`; broader engine or product refactors belong to `@dev`
- do not silently promote local entities
- do not lose the meaning of the source entity during promotion
- do not overwrite broader canon without resolving conflicts explicitly
- do not silently broaden one workspace's rule into a global default
- do not use promotion to advance live play state
- do not leave duplicate source cards behind unless the user explicitly wants parallel local and global variants
- do not leave two distinct canonical entities with the same visible title inside the same world context after promotion; add an epithet or qualifier if needed
- do not finish a promotion while stale links or broken path references to the old source location remain in directly affected files
- do not treat promoted facts as raw YAML transport; integrate them into readable canonical files
- do not move orphaned image files without their metadata cards and owner references
- do not localize a global rule in a way that accidentally contradicts broader defaults without surfacing the exception clearly

# Output

1. promoted entity in its new scope
2. note on source, target, and continuity impacts
3. any follow-up edits needed in related canon or in the originating adventure
