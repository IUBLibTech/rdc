# modified from hyrax 5.0.1 to search on partial matches
module Extensions
  module Qa
    module Authorities
      module Collections
        module CollectionsSearch
          def search(_q, controller)
            # The Hyrax::CollectionSearchBuilder expects a current_user
            return [] unless controller.current_user

            # line below facilitates searching on partial word match
            controller.params[:q] << '*' if controller.params[:q].to_s.size >= 2

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
