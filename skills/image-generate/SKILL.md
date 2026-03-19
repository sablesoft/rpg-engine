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
3. Check whether each participating entity already has a usable `Visual Concept` section or equivalent visual description in its card.
4. If a participating entity lacks a usable visual concept, synthesize a provisional visual concept from established canon before finalizing the prompt.
5. Store all missing or provisional visual concepts for all relevant participating entities in the temporary image card, not just for the owner.
6. Store any remaining concept gaps in the temporary image card as well.
7. Respect the current mode boundary:
   - in `master`, prefer reusable canon-bearing entities and prep materials
   - in `play`, prefer the active adventure context, current scene, and discovered local entities
8. Resolve the provider alias:
   - explicit alias from the user request
   - otherwise `default_provider` from `products/rpg-engine/config/image_providers.yaml`
   - otherwise fail clearly and ask for a configured provider
9. Select the closest image template:
   - character portrait
   - location key art
   - scene illustration
   - item or artifact plate
   - faction emblem or heraldic mark
10. Build a provider-neutral request using `./assets/image_request_template.md`.
11. Choose the provider profile that matches the requested backend:
   - `openai_image_api`
   - `local_invoke_sd`
12. Convert the neutral request into a provider-ready payload while preserving canonical facts, visual concept continuity, tone, composition intent, and negative constraints.
13. If the user asked for generation now, write the output image to `products/rpg-engine/tmp/` with a clear temporary filename.
14. Create a temporary image card next to the temporary image so prompt, owner, provider, depicted-entity information, and all missing visual concept material are not lost before persistence.
15. Return direct file paths to both the temporary image and its temporary card so the user can inspect them.
16. After the temporary media file is actually written, emit a clickable terminal link to the absolute `file://` path:
   - in Kitty, use a short bracketed label such as `[Показать изображение]`
   - otherwise use a regular OSC 8 label such as `[Открыть изображение]`
   - on macOS outside Kitty, also print a ready `open /absolute/path/to/image.png` fallback command
17. If the current terminal is Kitty, verify that `~/.config/kitty/kitty.conf` has a compatible `open_actions` rule for `mime image/*`; add or update it without duplicating entries when needed.
18. Keep the link output lightweight so it can be placed directly after the contextual generation text without extra wrapper prose.
19. In `master` and `play`, treat this image-link output as the image-specific subset of the broader file-link capability; do not expand the scope to arbitrary non-image files here.
20. Immediately ask the user what to do next with the temporary result:
   - save it
   - delete it
   - leave it in `tmp` for now
21. If the user asks to delete the temporary result, delete both the image and its temporary card together.
22. Explain that keeping the image as product content is a separate `image-save` step.

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
- do not skip the visual concept check for participating entities
- do not mistake a scene-specific appearance detail for a fully reusable visual concept without saying so in the temporary card
- do not record only the owner's missing concept when several participating entities in the same image also lack concepts
- do not emit the image link before the file is actually present on disk
- do not add duplicate Kitty `open_actions` rules for image previews

# Output

1. concise image brief grounded in canon
2. selected template type
3. resolved provider alias and driver
4. provider-neutral prompt package
5. provider-specific payload or command variant when requested
6. path to the temporary image in `products/rpg-engine/tmp/` when generation was performed
7. path to the temporary image card in `products/rpg-engine/tmp/` when generation was performed
8. clickable terminal link output for the temporary image, with platform fallback when needed
9. explicit next-step question asking whether to save, delete, or leave the temporary result
10. visual concept basis used for all materially relevant participating entities, including any that lacked concepts before generation
