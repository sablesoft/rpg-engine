# Image Rules

## Purpose

Define how image assets are stored, linked, promoted, and rendered through provider backends inside `rpg-engine`.

## Core principle

- every persisted image belongs to exactly one concrete entity
- image scope always follows owner entity scope
- image files are support artifacts, not standalone canon entities
- entities may have many images, but each image has only one owner
- an image may additionally reference secondary depicted entities when that improves discoverability and continuity
- every generated image should be grounded in a reusable visual concept for each participating entity when possible

## Visual concept

- a visual concept is a compact reusable description of how an entity should usually read visually across images
- visual concepts should capture stable identity signals such as silhouette, materials, recurring garments, age impression, symbolic marks, palette tendencies, posture logic, and other durable traits
- visual concepts should avoid overfitting to one transient scene state unless that state is canonically important and persistent
- a visual concept should leave room for dynamic changes such as injury, weather, emotional state, travel wear, ceremony, disguise, or other moment-specific variation
- visual concepts belong to the relevant entity cards, not to runtime

## Supported image-owning entity types

- `world`
- `scenario`
- `adventure`
- `scene`
- `character`
- `location`
- `quest`
- `faction`
- `species`
- `item`

## Scope and storage

- all freshly generated images should first be written into `products/rpg-engine/tmp/`
- the product-local `tmp/` directory is a staging area for review, not canon storage
- only `image-save` should move an approved image out of `products/rpg-engine/tmp/` into versioned workspace content
- store an image inside the same workspace scope that owns the target entity
- do not store one shared image pool above unrelated scopes
- use scope-local `images/` directories so promotion can move image sets predictably

### World workspace

- world-owned images live under:
  - `products/rpg-engine/workspaces/world/<world_slug>/images/<entity_type>/<entity_slug>/`
- world-owned scenario images live under:
  - `products/rpg-engine/workspaces/world/<world_slug>/scenarios/<scenario_slug>/images/<entity_type>/<entity_slug>/`

### Adventure workspace

- adventure-local images live under:
  - `products/rpg-engine/workspaces/adventure/<adventure_slug>/images/<entity_type>/<entity_slug>/`

## Persisted image package

Each persisted image package should contain:

- one binary or rendered media file:
  - `.../<image_slug>.<ext>`
- one metadata card:
  - `.../<image_slug>.md`

The metadata card is the readable source of truth for the image asset.

## Temporary generation

- `image-generate` produces temporary output in `products/rpg-engine/tmp/`
- `image-generate` should create both a temporary image file and a temporary image card together
- after generation, give the user a direct path to the temporary file
- after generation, emit a clickable OSC 8 `file://` link to the saved temporary image
- in Kitty, prefer a short bracketed link label such as `[Show Image]` and ensure image clicks open through compatible `open_actions` with `kitten icat`, preferably in overlay mode with `--hold`
- outside Kitty, still emit a regular OSC 8 `file://` link such as `[Open Image]`
- on macOS outside Kitty, also print a ready `open /absolute/path/to/image.png` fallback command near the link
- print the image link only after the media file is actually written to disk
- keep the link presentation lightweight so it can sit directly after scene text or generation-result text without extra wrapper prose
- after generation, give the user a direct path to the temporary image card as well
- after showing the result, immediately ask whether to save it, delete it, or leave it in `tmp`
- temporary files may be reviewed, discarded, regenerated, or saved later
- do not treat a temporary file in `products/rpg-engine/tmp/` as persisted content yet
- if a temporary image is deleted, delete its temporary image card together with it
- before generating an image, check whether each participating entity already has a usable visual concept
- if one or more participating entities lack a usable visual concept, synthesize provisional concepts from canon and store all of those missing concepts together in the temporary image card

## Metadata requirements

Each image metadata card must record:

- `image_slug`
- `owner_entity_type`
- `owner_entity_slug`
- `owner_card_path`
- `scope_level`
- `provider_alias`
- `provider_driver`
- `prompt_summary`
- `render_status`
- `media_file`
- `created_at`

Optional fields may include:

- `secondary_entities`
- `owner_visual_concept_basis`
- `secondary_visual_concept_basis`
- `visual_concept_gaps`
- `seed`
- `model`
- `size`
- `negative_prompt_summary`
- `notes`

## Entity linkage

- every image-owning entity card must include an `Images` section after the main descriptive sections when persisted images exist
- card-facing section names should follow `content_language` rather than being hard-coded in engine language
- the `Images` section should list image roles and link to the image metadata cards
- owner entity cards may embed one Markdown preview of a saved image near the beginning of the card, immediately after the first main entity-field section
- do not infer preview placement from localized section names; placement logic should follow card structure rather than a language-specific header list
- when an entity has multiple saved images, show only one of them as the card preview and list only the remaining non-preview images in `Images`
- embedded previews in owner cards are convenience renderings, not a replacement for the image metadata card
- an entity without persisted images should omit the section rather than keep an empty placeholder
- if the preview is the only saved image, omit `Images` rather than showing an empty section
- scene images must be linked from the owning scene file such as `current_scene.md` or the relevant `events/<id>.md`
- secondary depicted entities should not claim ownership of the image, but may reference it in a lightweight `Related Images` note when useful
- `image-save` is responsible for moving the temporary image card and updating these links when an image becomes persisted content
- `image-save` is also responsible for enriching entity `Visual Concept` sections when the temporary image card contains stable concept information that is missing from the entities
- one temporary image card may therefore carry concept material for several participating entities at once

## Secondary entity references

- use secondary entity references for depicted participants, locations, props, factions, or other canonically relevant entities that appear in the image without owning it
- secondary references are descriptive links, not ownership links
- the primary owner determines storage location, promotion behavior, and source-of-truth responsibility
- if a secondary entity later becomes the better canonical owner for a different image, create a separate image package for that entity rather than reassigning ownership silently
- secondary entities should be checked for visual concept availability before generation when they materially affect the image

## Multiplicity

- one entity may have multiple images for different roles such as portrait, full body, establishing shot, emblem, map plate, or scene beat
- image slugs must be unique within the owner entity folder
- use role-oriented names such as `portrait-01`, `arrival-scene-01`, `heraldic-seal-01`
- portrait-oriented roles such as `portrait-01` should default to portrait render size unless the user explicitly overrides the size

## Promotion semantics

- promotion may move image assets only when one of the following is true:
  - the owning entity is being promoted in the same operation
  - the owning entity already exists in the broader target scope and the user explicitly asked to promote a specific image
- never promote an image upward if its owner remains only in the narrower scope
- when an entity is promoted, move all explicitly selected images by default; if the user did not specify, ask only when the choice materially changes behavior, otherwise move all persisted images that still represent the same entity
- when an image is promoted, move both the media file and metadata card and update the owner entity `Images` section in source and target scopes
- if an entity keeps a local variant after promotion, local images remain local unless the user explicitly promotes those variants too

## Provider configuration

- provider definitions live in local product config, not in runtime and not in workspace canon
- commit a template file for provider structure
- keep concrete credentials in a local uncommitted config file and or environment variables
- the skill must resolve provider aliases in this order:
  - explicit provider alias from the user request
  - `default_provider` from local product config
  - fail clearly if no configured provider is available

## Credential handling

- prefer environment-variable references for secrets
- allow literal secrets only inside ignored local config files
- do not write secrets into `SKILL.md`, rules, workspace cards, runtime, or committed templates
- provider-specific non-secret defaults such as base URL, model, size, and sampler may live in local config

## Constraints

- do not attach one image to multiple entities
- do not store image provider credentials in runtime
- do not promote orphaned images
- do not use images as the only source of factual canon
- do not confuse secondary depiction references with ownership
- do not persist generated images directly from provider output without first staging them in `products/rpg-engine/tmp/`
- do not keep temporary image files and temporary image cards out of sync
- do not let scene-specific visual improvisation silently replace a more durable entity visual concept

## Principle

Images follow entities.  
Providers follow local config.
