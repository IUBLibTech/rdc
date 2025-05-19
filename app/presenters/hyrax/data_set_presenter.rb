module Hyrax
  class DataSetPresenter < Hyrax::WorkShowPresenter
    delegate :abstract, :description, :related_url, :references, :rights_notes, :time_period, :subject,
             :geographic_location, :domain_subject, :creator, :location_physical, :digital_specifications,
             :expert, :holding_location, :campus, :rights_statement, :bibliographic_citations,
             to: :solr_document
  end
end