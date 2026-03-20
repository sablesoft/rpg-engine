# RPG Engine

`rpg-engine` is a product of [product-engine](https://github.com/sablesoft/product-engine) for creating, running, and referencing tabletop-style role-playing game content.

Its purpose is to provide a structured product layer for:

- worldbuilding and canon management
- scenario and character creation
- playable adventure setup
- turn-by-turn adventure play
- read-only reference access to known content
- image prompt generation and image asset registration for canon and play support

## Installation

Install `rpg-engine` as a product inside a local `product-engine` checkout.

1. Clone `product-engine`:

```bash
git clone https://github.com/sablesoft/product-engine.git
cd product-engine
```

2. Clone the `rpg-engine` repository into `products/rpg-engine`:

```bash
git clone https://github.com/sablesoft/rpg-engine.git products/rpg-engine
```

3. After that, `product-engine` can treat `rpg-engine` as one of its connected products.

## Product role inside Product Engine

`product-engine` defines the shared engine architecture, runtime model, rules, and bootstrap workflows.

`rpg-engine` is one concrete product package built on top of that engine.
It adds RPG-specific:

- modes
- product rules
- product-local skills
- workspace conventions
- resumable product runtime

## Workspace Dictionary

Workspace-facing card titles, section labels, and entity-type labels should be resolved from:

- `products/rpg-engine/assets/workspace_dictionary/*.template.yaml`
- local overrides such as `products/rpg-engine/assets/workspace_dictionary/ru/sections.yaml`

This keeps `content_language` output consistent across scripts, templates, and hand-authored cards.
Committed repository content should keep only the template files.
If `content_language` is not `en`, create local translation files in that directory and adjust those instead of changing individual templates or helpers.
Card templates should also mark which top-level sections are required and which are optional.
Required sections must always be present in live cards, while optional sections may be omitted until they become meaningful.
Subsections may be added under any main section.
Use `Description` as the shared general-purpose descriptive section instead of introducing new top-level `Summary` fields.
Use `ruby products/rpg-engine/scripts/validate-workspace-cards` to verify that live workspace cards still match the current template structure.

## Core idea

`rpg-engine` separates global canon from local play.

- global canon lives in `world` repositories
- global scenarios and global characters belong to one world repository
- concrete playthroughs live in `adventure` repositories
- anything first created during play is local to that adventure by default until it is explicitly promoted

## Modes

- `@master` for creating, editing, and promoting canon-bearing content
- `@play` for starting and running an adventure
- `@ref` for read-only answers about established content

## Workspace model

Top-level workspace repositories:

- `world`
- `adventure`

`world` stores shared canon for one world together with its world-bound scenarios, characters, and support content.

`adventure` stores one concrete run with its own mutable state, local discoveries, event history, and session history.

## Repository strategy

This product repository stores the RPG product layer itself.

Concrete content may live in nested repositories:

- each world workspace may be its own git repository
- each adventure workspace may be its own git repository

This keeps the RPG engine independent from specific worlds, scenarios, and playthroughs.

## Runtime model

`rpg-engine` uses:

- engine runtime for the current global engine context
- product runtime for resumable RPG-local context
- workspace files as the source of truth for canon and mutable product state

## Image assets

Persisted images follow entity scope.

- world-scoped images live in the owning world workspace
- world-owned scenario images live inside that scenario subtree
- adventure-local images live inside the active adventure workspace
- each persisted image belongs to exactly one owner entity and is registered from that entity's card

Provider wiring is local to the product checkout:

- template: `config/image_providers.template.yaml`
- local uncommitted config: `config/image_providers.yaml`
- secrets should normally come from environment variables referenced by the local config

Local helper script:

- `ruby scripts/file-link --path path/to/file`
- `ruby scripts/image-link --path products/rpg-engine/tmp/example.png`
- `ruby products/rpg-engine/scripts/openai-image-request models`
- `ruby products/rpg-engine/scripts/openai-image-request generate --prompt "..." --output products/rpg-engine/tmp/example.png`

## Image generation

`rpg-engine` can generate images for RPG content through external image providers such as OpenAI or a local Stable Diffusion setup.

This is useful when you want:

- portraits for characters
- key art for locations
- illustrations for scenes
- symbols, emblems, relics, or other supporting visuals

### What it is for

Image generation is a support feature.

It helps you visualize content that already exists in the game material.
It should follow the written canon, not replace it.

### Two-step flow

Image work happens in two separate steps:

1. `image-generate`
   creates a temporary image in `products/rpg-engine/tmp/`, emits a clickable terminal link to it, and lets you look at it first

2. `image-save`
   takes an approved temporary image and saves it into the correct versioned content location, links it to the right entity, and writes image metadata

This split is intentional.
It lets you experiment freely without immediately polluting world or adventure content.

Visual continuity also develops in two steps:

- before image generation, the engine should look for a reusable visual concept for each important participating entity
- if an entity has no visual concept yet, a provisional one can be inferred from the written card and stored in the temporary image card
- when the image is later saved, missing visual concept details can be pushed back into the relevant entity cards

This helps later images stay visually consistent without locking entities into one rigid scene-specific appearance.

### How to enable it

1. Copy the template config:

```bash
cp products/rpg-engine/config/image_providers.template.yaml \
  products/rpg-engine/config/image_providers.yaml
```

2. Edit `products/rpg-engine/config/image_providers.yaml` and enable the provider you want to use.

3. Add whatever credentials that provider needs.
For example, an OpenAI setup normally uses `OPENAI_API_KEY` in your shell environment.

4. Test that the provider works:

```bash
ruby products/rpg-engine/scripts/openai-image-request models
```

### How to use it in `@master`

Use image generation in `@master` when you are preparing reusable content such as:

- a canonical character portrait
- a world location illustration
- a faction emblem
- a scenario-specific key image

In this mode, the usual flow is:

1. generate a temporary image
2. review it
3. save it into world or scenario content if you want to keep it

Typical examples:

- a portrait for a canonical character
- an illustration for a world location
- an emblem for a faction

### How to use it in `@play`

Use image generation in `@play` when you want visuals for the active adventure, for example:

- the current scene
- a newly introduced NPC
- a local adventure location
- a discovered item or clue

In this mode, the usual flow is:

1. generate a temporary image for the current adventure
2. review it
3. save it into the adventure only if you want to keep it

Images created in `@play` should stay local to the adventure unless the related entity is later promoted.

Typical examples:

- a picture of the current scene
- a local NPC introduced during play
- a newly discovered item or clue

### Practical command-line usage

Generate a temporary image into the product-local `products/rpg-engine/tmp/` folder:

```bash
ruby products/rpg-engine/scripts/openai-image-request generate \
  --prompt "A comet shrine at dusk, ritual fantasy, white stone, ash banners" \
  --output products/rpg-engine/tmp/comet-shrine.png
```

Useful options:

- `--provider` chooses a configured provider alias
- `--dry-run` shows the request without sending it
- `--prompt-file PATH` reads the prompt from a file
- `--size`, `--quality`, `--background`, `--format`, and `--compression` override output settings
- portrait-style roles should default to a portrait render size even if the provider itself defaults to landscape

If you already have an image on disk and just want the terminal preview link output again, use:

```bash
ruby scripts/image-link \
  --path products/rpg-engine/tmp/comet-shrine.png
```

If you want the same clickable terminal link behavior for a non-image product file, use:

```bash
ruby scripts/file-link \
  --path products/rpg-engine/workspaces/world/example-world/world.md
```

### What happens after generation

Temporary results should go into `products/rpg-engine/tmp/`.
After that you decide whether the image is worth keeping.

After a successful generation, the engine should print a clickable OSC 8 `file://` link to the saved temporary image.
In Kitty, the link should use Kitty-compatible image opening via `open_actions`.
Outside Kitty, the engine should still print a normal clickable file link, and on macOS it should also print a ready `open ...` fallback command.
In assistant responses, this terminal link output should be passed through directly rather than rewritten as a markdown path link.

If you do not want to keep it, it can remain a temporary file.

If you do want to keep it, `image-save` should:

- move it from `products/rpg-engine/tmp/` into the correct workspace `images/` folder
- give it a proper final name
- attach it to one primary owner entity
- keep one Markdown preview embed immediately after the first main entity-field section in the owner card so the main entity card shows a representative image
- keep the `Images` section only for additional non-preview saved images
- omit `Images` entirely when the preview is the only saved image
- add additional saved images as links in the same `Images` section without embedding them all inline
- write card-facing section headers in the workspace `content_language`
- optionally record other depicted entities as secondary references
- write the image metadata card
- update the owner entity so it knows about the saved image
- enrich missing `Visual Concept` notes in the relevant entity cards when the temporary image card contains stable visual identity details worth keeping

Each saved image should have one primary owner entity, even if other entities also appear in the picture.

### Response contract for image flows

When an image workflow returns file artifacts, the response contract should stay terminal-first:

- include relative paths for machine-readable workflow output
- include absolute paths when useful for local inspection or follow-up commands
- pass through clickable terminal link output directly
- on macOS, keep the emitted `open ...` fallback command
- do not rewrite these artifact links as markdown file links when the workflow already emitted terminal-friendly links

## First places to read

- [AGENTS.md](AGENTS.md)
- [product.yaml](product.yaml)
- [rules](rules)
- [modes](modes)
- [skills](skills)
