# frozen_string_literal: true
module Hyrax
  module Renderers
    class MarkdownAttributeRenderer < AttributeRenderer
      private

      def attribute_value_to_html(value)
        # text = value.join("\n\n")
        text = value
        DataCatalog::MarkdownService.call(text).html_safe
      end
    end
  end
end
