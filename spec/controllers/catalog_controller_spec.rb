require 'rails_helper'

RSpec.describe CatalogController do
  describe '#render_bookmarks_control?' do
    it 'returns false' do
      expect(controller.render_bookmarks_control?).to eq false
    end
  end
  describe '#index' do
    context 'with a query term' do
      it 'does not save searches' do
        expect { get 'index', params: { q: 'test' } }.not_to change { Search.count }
      end
    end
    context 'with documents' do
      before do
        FactoryBot.valkyrie_create(:collection)
        FactoryBot.valkyrie_create(:data_set)
      end
      it 'only shows works' do
        get :index
        expect(assigns(:response).docs.size).to eq 1
        expect(assigns(:response).docs.first).to be_work
      end
    end
  end
end
