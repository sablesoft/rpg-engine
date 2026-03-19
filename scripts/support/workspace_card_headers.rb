#!/usr/bin/env ruby
# frozen_string_literal: true

require "yaml"

module WorkspaceCardHeaders
  module_function

  REPO_ROOT = File.expand_path("../../../..", __dir__)
  RUNTIME_PATH = File.join(REPO_ROOT, "state", "runtime.yaml")

  HEADER_MAP = {
    preview: {
      en: "## Preview",
      ru: "## Превью"
    },
    images: {
      en: "## Images",
      ru: "## Изображения"
    },
    related_images: {
      en: "## Related Images",
      ru: "## Связанные изображения"
    },
    visual_concept: {
      en: "## Visual Concept",
      ru: "## Визуальный образ"
    }
  }.freeze

  def content_language
    return "ru" unless File.exist?(RUNTIME_PATH)

    data = YAML.load_file(RUNTIME_PATH) || {}
    value = data["content_language"].to_s.strip
    value.empty? ? "ru" : value
  rescue StandardError
    "ru"
  end

  def header(key)
    HEADER_MAP.fetch(key).fetch(content_language.to_sym, HEADER_MAP.fetch(key).fetch(:en))
  end

  def aliases(key)
    HEADER_MAP.fetch(key).values.uniq
  end
end
