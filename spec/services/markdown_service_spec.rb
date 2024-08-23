# frozen_string_literal: true
require 'rails_helper'

RSpec.describe DataCatalog::MarkdownService do

  describe '.call' do
    it 'converts markdown to html' do
      expect(described_class.call('**[IU](https://iu.edu)**')).to \
        eq("<p><strong><a href=\"https://iu.edu\">IU</a></strong></p>\n")
    end
  end
end
