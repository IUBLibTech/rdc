# frozen_string_literal: true
class OnlyWorksCatalogSearchBuilder < Hyrax::CatalogSearchBuilder
  def only_works?
    true
  end
end
