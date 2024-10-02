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

  # import hyrax method
  # Which translations are available for the user to select
  # @return [Hash{String => String}] locale abbreviations as keys and flags as values
  def available_translations
    {
      'de' => 'Deutsch',
      'en' => 'English',
      'es' => 'Español',
      'fr' => 'Français',
      'it' => 'Italiano',
      'pt-BR' => 'Português do Brasil',
      'zh' => '中文'
    }
  end
end
