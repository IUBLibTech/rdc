# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Hyrax::Renderers::CampusAttributeRenderer do

  subject { described_class.new("field", "values", "options") }

  describe "#li_value" do
    before {
      service_double = instance_double(Hyrax::CampusService)
      allow(Hyrax::CampusService).to receive(:new).and_return(service_double)
      allow(service_double).to receive(:label).with("B-Town").and_return "IUB"
      allow(subject).to receive(:search_path).with("B-Town").and_return "Bloomington"
      allow(ERB::Util).to receive(:h).with("IUB").and_return "Bton"
    }
    it "calls link_to" do
      expect(ERB::Util).to receive(:h).with("IUB")
      expect(subject).to receive(:search_path).with("B-Town")
      expect(subject).to receive(:link_to).with("Bton", "Bloomington")

      subject.send(:li_value, "B-Town")
    end
  end

end
