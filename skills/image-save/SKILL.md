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
- `./assets/entity_images_section_template.md`

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
9. Update the owner entity card with an `Images` section or add the new image entry to the existing section.
10. If secondary entities should reference the image, add lightweight related-image notes without turning them into co-owners.
11. Preserve versioned content readability after the save.

# Constraints

- do not save an image that is outside `products/rpg-engine/tmp/` unless the user explicitly asks
- do not save an image without its temporary image card unless the user explicitly asks to reconstruct metadata
- do not save an image without a primary owner entity
- do not attach one saved image to multiple owners
- do not invent canon details to fill missing metadata
- do not leave the saved image unlinked from its owner entity
- do not bypass scope rules from `products/rpg-engine/rules/image_rules.md`

# Output

1. final saved image path
2. final metadata card path
3. final image slug and filename
4. updated owner entity linkage
5. note on any secondary entity references that were added
