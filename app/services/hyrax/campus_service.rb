# frozen_string_literal: true
module Hyrax
  # Provide select options for the campus (dcterms:rights) field
  class CampusService < QaSelectService
    def initialize(_authority_name = nil)
      super('campuses')
    end
  end
end

