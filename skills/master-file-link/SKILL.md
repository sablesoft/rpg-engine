---
name: master-file-link
description: Emit clickable terminal links for saved workspace or tmp files while working in master mode. Use when the user wants to open a generated artifact, card, image, export, or other file directly from terminal output.
---

# Purpose

Provide a lightweight file-link workflow for `@master` so saved product artifacts can be opened directly from terminal output.

# Read before acting

- `AGENTS.md`
- `state/runtime.yaml`
- `products/rpg-engine/AGENTS.md`
- `products/rpg-engine/product.yaml`
- `products/rpg-engine/modes/master.yaml`
- `products/rpg-engine/rules/product_rules.md`
- `products/rpg-engine/rules/data_rules.md`
- `products/rpg-engine/rules/image_rules.md`

# Behavior

1. Resolve the requested file inside the product workspace or product tmp area.
2. Confirm that the file exists before emitting any link output.
3. Emit a clickable OSC 8 `file://` link to the absolute path.
4. If the file is an image, use the product image-aware terminal output flow so Kitty and macOS fallbacks behave correctly.
5. If the file is not an image, keep the output generic and lightweight.
6. On macOS, include a ready `open /absolute/path` fallback command when useful.

# Constraints

- do not emit links for nonexistent files
- do not bypass image-specific rules when the target is an image
- do not change canon or workspace state just to provide a file link
- do not duplicate full image-save or image-generate workflows here

# Output

1. resolved file path
2. clickable terminal link
3. optional fallback command
