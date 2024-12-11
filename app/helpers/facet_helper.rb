module FacetHelper
  def campus_label(value)
    Hyrax::CampusService.new.label(value)
  end
end
