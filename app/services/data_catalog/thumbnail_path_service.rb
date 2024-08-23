module DataCatalog
  class ThumbnailPathService < Hyrax::ThumbnailPathService
    def self.default_image
      nil
    end
  end
end