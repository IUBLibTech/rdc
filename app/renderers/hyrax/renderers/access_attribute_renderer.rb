# frozen_string_literal: true

module Hyrax
  module Renderers
    # This is used by PresentsAttributes to show access restrictions (faculty, staff, public etc.)
    #   e.g.: presenter.attribute_to_html(:access render_as: :access)
    class AccessAttributeRenderer < FacetedAttributeRenderer
      private

      #list on show page
      def li_value(value)
        link_to(ERB::Util.h(RightsStatementService.new.label(value)), search_path(value))
      end

    end
  end
end

