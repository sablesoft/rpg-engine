# Image Card Template

## Image Slug
{{image_slug}}

## Owner
- entity_type: {{owner_entity_type}}
- entity_slug: {{owner_entity_slug}}
- owner_card_path: {{owner_card_path}}
- scope_level: {{scope_level}}

## Secondary Entities
- entity_refs:
  - type: {{secondary_entity_type}}
    slug: {{secondary_entity_slug}}
    role_in_image: {{secondary_entity_role}}

## Visual Concept Basis
- participating_entity_visual_concepts:
  - type: {{participating_entity_type}}
    slug: {{participating_entity_slug}}
    relation_to_image: {{participating_entity_relation}}
    concept_status: {{participating_entity_concept_status}}
    concept_basis: {{participating_entity_visual_concept_basis}}
- visual_concept_gaps:
  - {{visual_concept_gap}}

## Role
- image_role: {{image_role}}
- intended_use: {{intended_use}}

## Provider
- provider_alias: {{provider_alias}}
- provider_driver: {{provider_driver}}
- model: {{model}}

## Prompt Summary
{{prompt_summary}}

## Render Details
- render_status: {{render_status}}
- size: {{size}}
- seed: {{seed}}
- created_at: {{created_at}}

## Files
- media_file: {{media_file}}

## Notes
{{notes}}
