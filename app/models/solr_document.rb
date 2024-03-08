# frozen_string_literal: true

# Represents a single document returned from Solr
class SolrDocument
  include Blacklight::Solr::Document
  include Blacklight::Gallery::OpenseadragonSolrDocument

  # Adds Hyrax behaviors to the SolrDocument.
  include Hyrax::SolrDocumentBehavior


  # self.unique_key = 'id'

  # Email uses the semantic field mappings below to generate the body of an email.
  SolrDocument.use_extension(Blacklight::Document::Email)

  # SMS uses the semantic field mappings below to generate the body of an SMS email.
  SolrDocument.use_extension(Blacklight::Document::Sms)

  # DublinCore uses the semantic field mappings below to assemble an OAI-compliant Dublin Core document
  # Semantic mappings of solr stored fields. Fields may be multi or
  # single valued. See Blacklight::Document::SemanticFields#field_semantics
  # and Blacklight::Document::SemanticFields#to_semantic_values
  # Recommendation: Use field names from Dublin Core
  use_extension(Blacklight::Document::DublinCore)

  # Do content negotiation for AF models. 

  use_extension( Hydra::ContentNegotiation )

  attribute :summary, Solr::String, "summary_tesim"
  attribute :documentation, Solr::String, "documentation_tesim"
  attribute :access_summary, Solr::String, "access_summary_tesim"
  attribute :access_process, Solr::String, "access_process_tesim"
  attribute :data_location, Solr::Array, "data_location_tesim"
  attribute :time_frame, Solr::Array, "time_frame_tesim"
  attribute :file_format, Solr::Array, "file_format_tesim"
  attribute :hosting_unit, Solr::Array, "hosting_unit_tesim"
  attribute :public_contact, Solr::Array, "public_contact_tesim"

end
