---
name: image-save
description: Save a reviewed temporary image from the product tmp folder into the correct versioned workspace location and link it to its owner entity.
---

# Purpose

Move a reviewed image and its already prepared temporary image card from `products/rpg-engine/tmp/` into the correct workspace `images/` subtree, then link the image to the right entities.

# Read before acting

- `AGENTS.md`
- `state/runtime.yaml`
- `.agents/rules/product_rules.md`
- `.agents/rules/skill_rules.md`
- `products/rpg-engine/AGENTS.md`
- `products/rpg-engine/product.yaml`
- `products/rpg-engine/modes/master.yaml`
- `products/rpg-engine/modes/play.yaml`
- `products/rpg-engine/rules/product_rules.md`
- `products/rpg-engine/rules/canon_rules.md`
- `products/rpg-engine/rules/image_rules.md`

# Behavior

1. Confirm the source image exists inside `products/rpg-engine/tmp/`.
2. Confirm the matching temporary image card exists inside `products/rpg-engine/tmp/`.
3. Identify the primary owner entity and any relevant secondary depicted entities.
4. Confirm the owner scope:
   - `world`
   - world-owned `scenario`
   - `adventure`
5. Determine the correct destination folder under that scope's `images/` subtree.
6. Choose or normalize the final image slug and filename.
7. Move the image file from `products/rpg-engine/tmp/` into the destination folder.
8. Move and adapt the temporary image card so it becomes the final metadata card next to the saved image.
9. Check which involved entities still lack a usable `Visual Concept` section.
10. Read the temporary image card as a shared concept source for all participating entities in the image, not just the owner.
11. If the temporary image card contains stable visual concept information that is missing from those entities, add or enrich their `Visual Concept` sections.
12. Update the owner entity card with an `Images` section or add the new image entry to the existing section.
13. Keep at most one active preview image for the owner card:
   - if the card has no preview yet, the first saved image may become that preview
   - place the inline preview near the beginning of the card, immediately after the `Type` section
   - keep the preview itself out of `## Images`
   - use `## Images` only for additional non-preview saved images
   - if no additional saved images remain after the preview is chosen, omit `## Images` entirely
14. If secondary entities should reference the image, add lightweight related-image notes without turning them into co-owners.
15. Preserve versioned content readability after the save.

# Constraints

- do not save an image that is outside `products/rpg-engine/tmp/` unless the user explicitly asks
- do not save an image without its temporary image card unless the user explicitly asks to reconstruct metadata
- do not save an image without a primary owner entity
- do not attach one saved image to multiple owners
- do not invent canon details to fill missing metadata
- do not leave the saved image unlinked from its owner entity
- do not bypass scope rules from `products/rpg-engine/rules/image_rules.md`
- do not write a rigid visual concept that blocks ordinary future scene variation
- do not overwrite an existing stronger visual concept with a weaker image-derived guess
- do not ignore missing concepts for non-owner participating entities when the temporary image card already contains usable concept material for them
- do not replace the metadata card with a bare image embed; keep the metadata link in the owner card
- do not embed every saved image inline in the owner card when an entity has multiple images
- do not keep the active preview embed buried inside `## Images`
- do not keep an empty `## Images` section when the preview is the only saved image

# Output

1. final saved image path
2. final metadata card path
3. final image slug and filename
4. updated owner entity linkage
5. note on any secondary entity references that were added
6. note on any entity `Visual Concept` sections that were created or enriched

## Delivery note

- when saving was performed, pass through the emitted terminal link output directly instead of rewriting it as markdown file links
- include both relative and absolute paths for the saved image and metadata card when useful
- prefer showing clickable terminal links for both the saved image and its metadata card
