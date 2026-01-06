# frozen_string_literal: true
module Hyrax
  module Renderers
    # This is used by PresentsAttributes to show domain subjects
    class DomainSubjectAttributeRenderer < FacetedAttributeRenderer
      private
        def li_value(value)
          link_to(ERB::Util.h(DomainSubjectService.new.label(value)), search_path(value))
        end
    end
  end
end

