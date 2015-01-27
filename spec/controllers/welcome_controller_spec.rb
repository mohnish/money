require 'rails_helper'

RSpec.describe WelcomeController do
  describe 'GET /signup' do
    it 'renders the signup form' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /signin' do
    it 'render the signin form' do
      expect(response).to have_http_status(:ok)
    end
  end
end
