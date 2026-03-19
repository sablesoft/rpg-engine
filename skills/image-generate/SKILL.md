---
name: image-generate
description: Generate temporary RPG images into the product-local tmp folder for review before they are saved into versioned content.
---

# Purpose

Generate temporary image outputs for RPG canon or adventure context and place them in `products/rpg-engine/tmp/` for review.

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
- `products/rpg-engine/config/image_providers.template.yaml`
- `./assets/image_card_template.md`
- `./assets/image_request_template.md`
- `./assets/provider_profiles.yaml`
- `./assets/character_image_template.md`
- `./assets/location_image_template.md`
- `./assets/scene_image_template.md`
- `./assets/item_image_template.md`
- `./assets/faction_emblem_template.md`

# Behavior

1. Identify the target entity or scene and confirm whether the source of truth is a `world` or `adventure` workspace.
2. Gather only established facts needed for the image brief.
3. Respect the current mode boundary:
   - in `master`, prefer reusable canon-bearing entities and prep materials
   - in `play`, prefer the active adventure context, current scene, and discovered local entities
4. Resolve the provider alias:
   - explicit alias from the user request
   - otherwise `default_provider` from `products/rpg-engine/config/image_providers.yaml`
   - otherwise fail clearly and ask for a configured provider
5. Select the closest image template:
   - character portrait
   - location key art
   - scene illustration
   - item or artifact plate
   - faction emblem or heraldic mark
6. Build a provider-neutral request using `./assets/image_request_template.md`.
7. Choose the provider profile that matches the requested backend:
   - `openai_image_api`
   - `local_invoke_sd`
8. Convert the neutral request into a provider-ready payload while preserving canonical facts, tone, composition intent, and negative constraints.
9. If the user asked for generation now, write the output image to `products/rpg-engine/tmp/` with a clear temporary filename.
10. Create a temporary image card next to the temporary image so prompt, owner, provider, and depicted-entity information are not lost before persistence.
11. Return direct file paths to both the temporary image and its temporary card so the user can inspect them.
12. Immediately ask the user what to do next with the temporary result:
   - save it
   - delete it
   - leave it in `tmp` for now
13. If the user asks to delete the temporary result, delete both the image and its temporary card together.
14. Explain that keeping the image as product content is a separate `image-save` step.

# Provider notes

- `openai_image_api` is appropriate when the user wants a hosted API workflow with JSON payloads.
- `local_invoke_sd` is appropriate when the user wants local Stable Diffusion or InvokeAI style generation with model, sampler, and size controls.
- When provider capabilities differ, preserve canon first and adapt style wording second.
- If a provider cannot reliably support a requested constraint, say so plainly in the request package.
- Use local config aliases to resolve base URLs, default models, and auth wiring; do not read secrets from runtime or workspace files.

# Constraints

- do not invent canon details that are absent from the selected source files
- do not treat visual style guesses as established world facts
- do not overwrite workspace canon just to make an image prompt richer
- do not hard-code the skill to a single image backend
- do not require live API access when the user only asked for prompt preparation
- do not advance play state while preparing artwork support
- do not promote adventure-local details into global canon unless the user explicitly asks
- do not persist the image into workspace content directly from this skill
- do not place temporary image output outside `products/rpg-engine/tmp/` unless the user explicitly asks
- do not leave a temporary image without its temporary image card
- do not delete a temporary image without also deleting its temporary image card

# Output

1. concise image brief grounded in canon
2. selected template type
3. resolved provider alias and driver
4. provider-neutral prompt package
5. provider-specific payload or command variant when requested
6. path to the temporary image in `products/rpg-engine/tmp/` when generation was performed
7. path to the temporary image card in `products/rpg-engine/tmp/` when generation was performed
8. explicit next-step question asking whether to save, delete, or leave the temporary result
