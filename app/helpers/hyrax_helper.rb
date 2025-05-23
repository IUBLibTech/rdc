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

  # override hyrax method
  # Which translations are available for the user to select
  # @return [Hash{String => String}] locale abbreviations as keys and flags as values
  def available_translations
    {
      'en' => 'English'
    }
  end

  def hint_with_links(key)
    auto_link(I18n.t("simple_form.hints.data_set.#{key}"), html: { target: '_blank' })
  end
end
