# frozen_string_literal: true
module Hyrax
  module Renderers
    # This is used by PresentsAttributes to show campuses
    #   e.g.: presenter.attribute_to_html(:campus, render_as: :campus)
    class CampusAttributeRenderer < FacetedAttributeRenderer
      private
        def li_value(value)
          link_to(ERB::Util.h(CampusService.new.label(value)), search_path(value))
        end
    end
  end
end

