module Hyrax
  class DataSetPresenter < Hyrax::WorkShowPresenter
    delegate :summary, :documentation, :access_summary, :access_process, :data_location, :time_frame,
             :file_format, :hosting_unit, :public_contact,
             to: :solr_document
  end
end