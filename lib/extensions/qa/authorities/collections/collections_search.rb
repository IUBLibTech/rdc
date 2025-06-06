# unmodified from hyrax 5.0.1
module Extensions
  module Qa
    module Authorities
      module Collections
        module CollectionsSearch
          def search(_q, controller)
            # The Hyrax::CollectionSearchBuilder expects a current_user
            return [] unless controller.current_user
            response, = search_response(controller)
            docs = response.documents
      
            docs.map do |doc|
              { id: doc.id, label: doc.title, value: doc.id }
            end
          end
        end
      end
    end
  end
end
