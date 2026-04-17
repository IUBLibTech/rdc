# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Hyrax::DomainSubjectService do

  describe "#initialize" do
    before {
      allow(Hyrax::QaSelectService).to receive(:new)
    }
    it "calls parent class with super" do
      expect(Hyrax::QaSelectService).to receive(:new)

      Hyrax::DomainSubjectService.new(authority_name: nil)
    end
  end
end
