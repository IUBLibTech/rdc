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

  attribute :abstract, Solr::Array, "abstract_tesim"
  attribute :description, Solr::Array, "description_tesim"
  attribute :related_url, Solr::Array, "related_url_tesim"
  attribute :references, Solr::Array, "references_tesim"
  attribute :rights_notes, Solr::Array, "rights_notes_tesim"
  attribute :time_period, Solr::Array, "time_period_tesim"
  attribute :subject, Solr::Array, "subject_tesim"
  attribute :geographic_location, Solr::Array, "geographic_location_tesim"
  attribute :domain_subject, Solr::Array, "domain_subject_tesim"
  attribute :creator, Solr::Array, "creator_tesim"
  attribute :location_physical, Solr::Array, "location_physical_tesim"
  attribute :digital_specifications, Solr::Array, "digital_specifications_tesim"
  attribute :expert, Solr::Array, "expert_tesim"
  attribute :holding_location, Solr::Array, "holding_location_tesim"
  attribute :campus, Solr::Array, "campus_tesim"
  attribute :rights_statement, Solr::Array, "rights_statement_tesim"
  attribute :bibliographic_citation, Solr::Array, "bibliographic_citation_tesim"

end
