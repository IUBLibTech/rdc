# frozen_string_literal: true
module Hyrax
  # Provide select options for the domain subject field
  class DomainSubjectService < QaSelectService
    def initialize(_authority_name = nil)
      super('domain_subjects')
    end
  end
end

