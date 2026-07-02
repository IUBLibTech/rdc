require 'rails_helper'

describe RobotsController do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:name) { 'robots_txt' }
  let(:existing_block) { ContentBlock.where(name: name).first || ContentBlock.create(name: name, value: '') }
  let(:content_block) { existing_block.value = content; existing_block.save; existing_block }
  let(:content) { "User-Agent: *\nDisallow: /concern" }
  let(:new_content) { 'Disallow: *' }

  after do
    ContentBlock.delete(name)
  end

  describe '#show' do
    it 'is blank by default' do
      get :show
      expect(response).to be_successful
      expect(response.body).to eq ''
    end

    it 'renders the value' do
      content_block
      get :show
      expect(response).to be_successful
      expect(response.body).to eq content
    end

    it 'is route for /robots.txt', type: :routing do
      expect(get: '/robots.txt').to route_to(controller: 'robots', action: 'show', format: 'txt')
    end
  end

  describe '#edit' do
    it 'is unavailable to the public' do
      get :edit
      expect(response).to redirect_to('/')
    end

    it 'is unavailable to regular users' do
      sign_in user
      get :edit
      expect(response).to be_unauthorized
    end

    context 'with rendering' do
      render_views
      it 'is rendered for admins' do
        content_block
        sign_in admin
        get :edit
        expect(response).to be_successful
        expect(response.body).to include(content)
      end
    end
  end

  describe '#update' do
    it 'is unavailable to the public' do
      patch :update, params: { content_block: { value: new_content } }
      expect(response).to redirect_to('/')
    end

    it 'is unavailable to regular users' do
      sign_in user
      patch :update, params: { content_block: { value: new_content } }
      expect(response).to be_unauthorized
    end

    it 'is updated for admins' do
      content_block
      sign_in admin
      patch :update, params: { content_block: { value: new_content } }
      expect(response).to redirect_to(edit_robots_path)
      get :show
      expect(response.body).to eq new_content
    end
  end
end
