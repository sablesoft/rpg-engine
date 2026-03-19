#!/usr/bin/env ruby
# frozen_string_literal: true

require "yaml"

module WorkspaceDictionary
  module_function

  REPO_ROOT = File.expand_path("../../../..", __dir__)
  RUNTIME_PATH = File.join(REPO_ROOT, "state", "runtime.yaml")
  DICTIONARY_DIR = File.join(REPO_ROOT, "products", "rpg-engine", "assets", "workspace_dictionary")
  FALLBACK_LANGUAGE = "en"
  GROUPS = %w[
    document_titles
    entity_types
    sections
    character
    world
    scenario
    adventure
    location
    faction
    species
    quest
  ].freeze

  def dictionary_dir
    DICTIONARY_DIR
  end

  def content_language
    return "ru" unless File.exist?(RUNTIME_PATH)

    data = YAML.load_file(RUNTIME_PATH) || {}
    value = data["content_language"].to_s.strip
    value.empty? ? "ru" : value
  rescue StandardError
    "ru"
  end

  def template_path(group)
    File.join(DICTIONARY_DIR, "#{group}.template.yaml")
  end

  def local_path(group, language)
    File.join(DICTIONARY_DIR, language, "#{group}.yaml")
  end

  def template_data(group)
    path = template_path(group)
    File.exist?(path) ? (YAML.load_file(path) || {}) : {}
  end

  def local_data(group, language)
    path = local_path(group, language)
    File.exist?(path) ? (YAML.load_file(path) || {}) : {}
  end

  def group_data(group, language: content_language)
    data = template_data(group)
    return data if language == FALLBACK_LANGUAGE

    data.merge(local_data(group, language))
  end

  def lookup(group, key, language: content_language)
    group_data(group, language: language)[key.to_s]
  end

  def label(group, key, language: content_language)
    lookup(group, key, language: language)
  end

  def section_label(key, language: content_language)
    lookup(:sections, key, language: language)
  end

  def section_header(key, language: content_language)
    label = section_label(key, language: language)
    label ? "## #{label}" : nil
  end

  def section_aliases(key)
    values = []
    values << lookup(:sections, key, language: FALLBACK_LANGUAGE)
    Dir.glob(File.join(DICTIONARY_DIR, "*", "sections.yaml")).each do |path|
      language = File.basename(File.dirname(path))
      values << lookup(:sections, key, language: language)
    end
    values.compact.uniq.map { |value| "## #{value}" }
  end

  def entity_type(key, language: content_language)
    lookup(:entity_types, key, language: language)
  end

  def document_title(key, language: content_language)
    lookup(:document_titles, key, language: language)
  end
end
