require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  render_views

  describe 'GET /api/users/id' do
    context 'when a valid id is passed' do
      let(:user) { create(:user) }

      it 'returns the user details' do
        get :show, { id: user.id, format: 'json' }
        result = JSON.parse(response.body)
        expect(response).to have_http_status(:success)
        expect(result['id']).to be(user.id)
      end
    end
  end

  describe 'POST /api/users/' do
    context 'when valid details are passed' do
      let(:params) do
        {
          format: 'json',
          username: 'mohnish',
          first_name: 'brad',
          last_name: 'bond',
          email_address: 'mt@mt.cx',
          phone_number: '9879879870',
          password: 'test1234'
        }
      end

      it 'creates a user with a 201 status code' do
        post :create, params
        expect(response).to have_http_status(:created)
        expect(User.find_by(username: params[:username])).to_not be_nil
      end
    end

    context 'when invalid details are passed' do
      context 'when the passed in details fail validations', focus: true do
        let(:invalid_params) do
          {
            format: 'json',
            username: 'mohnish',
            first_name: 'brad',
            last_name: 'bond',
            email_address: 'mtmt',
            phone_number: 'abc',
            password: 'test1234'
          }
        end

        it 'returns errors with a 422 status code' do
          post :create, invalid_params
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'when details are missing' do
        let(:missing_params) do
          {
            format: 'json',
            username: 'mohnish',
            first_name: 'brad',
            last_name: 'bond',
            email_address: 'mt@mt.cx',
            phone_number: '9879879870',
            password: 'test1234'
          }
        end

        it 'returns errors with a 422 status code' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'when details are reused by another user' do
        let(:reused_params) do
          {
            format: 'json',
            username: 'mohnish',
            first_name: 'brad',
            last_name: 'bond',
            email_address: 'mt@mt.cx',
            phone_number: '9879879870',
            password: 'test1234'
          }
        end

        it 'returns errors with a 422 status code' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
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
