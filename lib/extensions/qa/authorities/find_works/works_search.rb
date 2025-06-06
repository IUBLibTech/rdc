# unmodified from hyrax 5.0.1
module Extensions
  module Qa
    module Authorities
      module FindWorks
        module WorksSearch
          def search(_q, controller)
            # The My::FindWorksSearchBuilder expects a current_user
            return [] unless controller.current_user
      
            response, _docs = search_response(controller)
            docs = response.documents
            docs.map do |doc|
              id = doc.id
              title = doc.title
              { id: id, label: title, value: id }
            end
          end
        end
      end
    end
  end
end
