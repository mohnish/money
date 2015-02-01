require 'rails_helper'

RSpec.describe WelcomeController do
  describe 'GET /signup' do
    it 'renders the signup form' do
      get :signup
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:signup)
    end
  end

  describe 'GET /signin' do
    it 'render the signin form' do
      get :signin
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:signin)
    end
  end
end
