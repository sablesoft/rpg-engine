# RPG Engine

`rpg-engine` is a product of [product-engine](https://github.com/sablesoft/product-engine) for creating, running, and referencing tabletop-style role-playing game content.

Its purpose is to provide a structured product layer for:

- worldbuilding and canon management
- scenario and character creation
- playable adventure setup
- turn-by-turn adventure play
- read-only reference access to known content

## Product role inside Product Engine

`product-engine` defines the shared engine architecture, runtime model, rules, and bootstrap workflows.

`rpg-engine` is one concrete product package built on top of that engine.
It adds RPG-specific:

- modes
- product rules
- product-local skills
- workspace conventions
- resumable product runtime

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

## Runtime model

`rpg-engine` uses:

- engine runtime for the current global engine context
- product runtime for resumable RPG-local context
- workspace files as the source of truth for canon and mutable product state

## First places to read

- [AGENTS.md](AGENTS.md)
- [product.yaml](product.yaml)
- [rules](rules)
- [modes](modes)
- [skills](skills)
