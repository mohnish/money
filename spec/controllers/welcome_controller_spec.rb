require 'rails_helper'

RSpec.describe WelcomeController do
  describe 'GET /' do
    it 'renders index template' do
      get :index
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
    end
  end

  describe 'POST /' do
    it 'renders index template' do
      post :index
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
    end
  end
end
