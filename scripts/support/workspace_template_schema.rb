#!/usr/bin/env ruby
# frozen_string_literal: true

require "pathname"
require_relative "workspace_dictionary"

module WorkspaceTemplateSchema
  module_function

  REPO_ROOT = File.expand_path("../../../..", __dir__)
  PRODUCT_ROOT = File.join(REPO_ROOT, "products", "rpg-engine")
  ADVENTURE_ROOT = File.join(PRODUCT_ROOT, "workspaces", "adventure")
  WORLD_ROOT = File.join(PRODUCT_ROOT, "workspaces", "world")

  TEMPLATE_MAP = {
    ["adventure", "adventure.md"] => "skills/play-bootstrap-adventure/assets/adventure_card_template.md",
    ["adventure", "world.md"] => "skills/master-bootstrap-world/assets/world_card_template.md",
    ["adventure", "scenario.md"] => "skills/master-bootstrap-scenario/assets/scenario_card_template.md",
    ["adventure", "current_scene.md"] => "skills/play-run-adventure/assets/current_scene_template.md",
    ["adventure", %r{\Asessions/[^/]+\.md\z}] => "skills/play-run-adventure/assets/session_log_template.md",
    ["adventure", %r{\Aevents/[^/]+\.md\z}] => "skills/play-run-adventure/assets/event_template.md",
    ["adventure", %r{\Acharacters/[^/]+\.md\z}] => "skills/master-bootstrap-character/assets/character_card_template.md",
    ["adventure", %r{\Alocations/[^/]+\.md\z}] => "skills/play-bootstrap-adventure/assets/location_card_template.md",
    ["adventure", %r{\Aquests/[^/]+\.md\z}] => "skills/play-bootstrap-adventure/assets/quest_card_template.md",
    ["adventure", %r{\Afactions/[^/]+\.md\z}] => "skills/master-bootstrap-world/assets/faction_card_template.md",
    ["adventure", %r{\Aspecies/[^/]+\.md\z}] => "skills/master-bootstrap-world/assets/species_card_template.md",
    ["world", "world.md"] => "skills/master-bootstrap-world/assets/world_card_template.md",
    ["world", "setting.md"] => "skills/master-bootstrap-world/assets/setting_template.md",
    ["world", "rules_of_world.md"] => "skills/master-bootstrap-world/assets/rules_of_world_template.md",
    ["world", "tone_and_themes.md"] => "skills/master-bootstrap-world/assets/tone_and_theme_template.md",
    ["world", %r{\Acharacters/[^/]+\.md\z}] => "skills/master-bootstrap-character/assets/character_card_template.md",
    ["world", %r{\Alocations/[^/]+\.md\z}] => "skills/master-bootstrap-world/assets/location_card_template.md",
    ["world", %r{\Afactions/[^/]+\.md\z}] => "skills/master-bootstrap-world/assets/faction_card_template.md",
    ["world", %r{\Aspecies/[^/]+\.md\z}] => "skills/master-bootstrap-world/assets/species_card_template.md",
    ["world", %r{\Ascenarios/[^/]+/scenario\.md\z}] => "skills/master-bootstrap-scenario/assets/scenario_card_template.md",
    ["world", %r{\Ascenarios/[^/]+/global_story\.md\z}] => "skills/master-bootstrap-scenario/assets/global_story_template.md",
    ["world", %r{\Ascenarios/[^/]+/tone_and_themes\.md\z}] => "skills/master-bootstrap-scenario/assets/tone_and_theme_template.md",
    ["world", %r{\Ascenarios/[^/]+/quests/[^/]+\.md\z}] => "skills/master-bootstrap-scenario/assets/quest_card_template.md",
    ["world", %r{\Ascenarios/[^/]+/locations/[^/]+\.md\z}] => "skills/master-bootstrap-world/assets/location_card_template.md",
    ["world", %r{\Ascenarios/[^/]+/characters/[^/]+\.md\z}] => "skills/master-bootstrap-character/assets/character_card_template.md"
  }.freeze

  def template_for(card_path)
    card = Pathname.new(card_path).expand_path
    scope, relative = workspace_scope_and_relative(card)
    return nil unless scope && relative

    TEMPLATE_MAP.each do |(candidate_scope, matcher), template_rel|
      next unless candidate_scope == scope
      matched = matcher.is_a?(Regexp) ? relative.match?(matcher) : relative == matcher
      return File.join(PRODUCT_ROOT, template_rel) if matched
    end

    nil
  end

  def workspace_scope_and_relative(card)
    card_s = card.to_s

    if card_s.start_with?(ADVENTURE_ROOT + "/")
      workspace_root = first_workspace_root(card, ADVENTURE_ROOT)
      return nil unless workspace_root

      relative = card.relative_path_from(Pathname.new(workspace_root)).to_s
      return ["adventure", relative]
    end

    if card_s.start_with?(WORLD_ROOT + "/")
      workspace_root = first_workspace_root(card, WORLD_ROOT)
      return nil unless workspace_root

      relative = card.relative_path_from(Pathname.new(workspace_root)).to_s
      return ["world", relative]
    end

    nil
  end

  def first_workspace_root(card, root_dir)
    root = Pathname.new(root_dir)
    relative = card.relative_path_from(root).each_filename.to_a
    return nil if relative.empty?

    root.join(relative.first).to_s
  end

  def parse(template_path)
    content = File.read(template_path)
    {
      required: resolve_labels(extract_comment_list(content, "Required sections")),
      optional: resolve_labels(extract_comment_list(content, "Optional sections")),
      allowed: resolve_labels(extract_template_headings(content))
    }
  end

  def extract_comment_list(content, heading)
    lines = content.lines
    start_index = lines.find_index { |line| line.strip == "#{heading}:" }
    return [] unless start_index

    values = []
    index = start_index + 1
    while index < lines.length
      line = lines[index].strip
      break unless line.start_with?("- ")

      values << line.delete_prefix("- ").strip
      index += 1
    end
    values
  end

  def extract_template_headings(content)
    content.lines
      .map(&:chomp)
      .grep(/^## /)
      .map { |line| line.delete_prefix("## ").strip }
  end

  def resolve_labels(values)
    values.map { |value| resolve_placeholder(value) }.compact.uniq
  end

  def resolve_placeholder(value)
    if (match = value.match(/\A\{\{dict\.([a-z_]+)\.([a-z_]+)\}\}\z/))
      WorkspaceDictionary.label(match[1], match[2])
    else
      value unless value.empty?
    end
  end

  def top_level_sections(card_path)
    File.readlines(card_path, chomp: true)
      .grep(/^## /)
      .map { |line| line.delete_prefix("## ").strip }
  end
end
