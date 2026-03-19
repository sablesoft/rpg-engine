#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "workspace_dictionary"

module WorkspaceCardHeaders
  module_function

  def content_language
    WorkspaceDictionary.content_language
  end

  def header(key)
    WorkspaceDictionary.section_header(key)
  end

  def aliases(key)
    WorkspaceDictionary.section_aliases(key)
  end
end
