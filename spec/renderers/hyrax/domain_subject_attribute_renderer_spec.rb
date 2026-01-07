# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Hyrax::Renderers::DomainSubjectAttributeRenderer do

  subject { described_class.new("field", "values", "options") }

  describe "#li_value" do
    before {
      service_double = instance_double(Hyrax::DomainSubjectService)
      allow(Hyrax::DomainSubjectService).to receive(:new).and_return(service_double)
      allow(service_double).to receive(:label).with("informatics").and_return "engineering"
      allow(subject).to receive(:search_path).with("informatics").and_return "computing"
      allow(ERB::Util).to receive(:h).with("engineering").and_return "programming"
    }
    it "calls link_to" do
      expect(ERB::Util).to receive(:h).with("engineering")
      expect(subject).to receive(:search_path).with("informatics")
      expect(subject).to receive(:link_to).with("programming", "computing")

      subject.send(:li_value, "informatics")
    end
  end


end