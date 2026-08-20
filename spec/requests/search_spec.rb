require 'rails_helper'

RSpec.describe 'Catalog Search', type: :request do
  describe 'GET /catalog' do
    it 'should restrict to 10 results per page for non-logged in users' do
      get "/catalog.json?search_field=all_fields&q=Moomin&per_page=100"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['response']['pages']['limit_value']).to eq 10
    end
  end
end
