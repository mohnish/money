require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  render_views

  describe 'GET /users/id', focus: true do
    context 'when a valid id is passed' do
      let(:user) { create(:user) }

      it 'returns the user details' do
        get :show, { id: user.id, format: 'json' }
        result = JSON.parse(response.body)
        expect(response).to have_http_status(:success)
        expect(result['id']).to be(user.id)
      end
    end

    context 'when an invalid id is passed' do
      it 'returns a 404' do
        get :show, { id: 'invalid', format: 'json' }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "GET create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
