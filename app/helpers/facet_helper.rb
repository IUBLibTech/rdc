module FacetHelper
  def campus_label(value)
    Hyrax::CampusService.new.label(value)
  end

  def access_restrictions_label(value)
    Hyrax::RightsStatementService.new.label(value)
  end

  def campus_helper(**options)
    options[:value].map { |value| link_to_campus_facet(value, 'campus_sim') }.join("<br/>".html_safe).html_safe
  end

  # campus-specific version of link_to_facet
  # @param item [Object]
  # @param field [String]
  # @return [ActiveSupport::SafeBuffer] the html_safe link
  def link_to_campus_facet(item, field)
    path = search_action_path(search_state.add_facet_params_and_redirect(field, item))
    item = campus_label(item)
    link_to(item, path)
  end
end
