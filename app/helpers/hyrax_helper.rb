# frozen_string_literal: true
module HyraxHelper
  include ::BlacklightHelper
  include Hyrax::BlacklightOverride
  include Hyrax::HyraxHelperBehavior

  # For use as helper method in catalog controller field definitions.
  def render_markdown(field)
    text = field[:value].join("\n\n")
    DataCatalog::MarkdownService.call(text).html_safe
  end
end
