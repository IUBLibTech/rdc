module Extensions
  module Hyrax
    module SolrQueryService
      # Create a raw query clause suitable for sending to solr as an fq element
      # @param [String] type The type of query to run. Either 'raw' or 'field'
      # @param [String] key
      # @param [String] value
      def query_clause(type, key, value)
        "_query_:\"{!#{type} f=#{key}}#{value.to_s.gsub('"', '\"')}\""
      end
    end
  end
end
