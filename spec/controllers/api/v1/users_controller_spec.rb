require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  render_views
  setup_doorkeeper

  describe 'GET /api/users/id' do
    context 'when a valid id is passed' do
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
      context 'when the passed in details fail validations' do
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
          result = JSON.parse(response.body)
          expect(result['errors']).not_to be_blank
          expect(result['errors']['email_address']).to eql(['is invalid'])
        end
      end

      context 'when details are missing' do
        let(:missing_params) do
          {
            format: 'json',
            username: 'mohnish',
            email_address: 'mt@mt.cx',
            phone_number: '9879879870',
            password: 'test1234'
          }
        end

        it 'returns errors with a 422 status code' do
          post :create, missing_params
          expect(response).to have_http_status(:unprocessable_entity)
          result = JSON.parse(response.body)
          expect(result['errors']).not_to be_blank
          expect(result['errors']['first_name']).to eql(["can't be blank"])
          expect(result['errors']['last_name']).to eql(["can't be blank"])
        end
      end

      context 'when details are reused by another user' do
        let(:reused_params) do
          {
            format: 'json',
            username: user.username,
            first_name: 'brad',
            last_name: 'bond',
            email_address: user.email_address,
            phone_number: '9879879870',
            password: 'test1234'
          }
        end

        it 'returns errors with a 422 status code' do
          post :create, reused_params
          expect(response).to have_http_status(:unprocessable_entity)
          result = JSON.parse(response.body)
          expect(result['errors']).not_to be_blank
          expect(result['errors']['username']).to eql(['has already been taken'])
          expect(result['errors']['email_address']).to eql(['has already been taken'])
        end
      end
    end
  end

  describe 'PATCH /api/users/id' do
    context 'when valid details are passed' do
      let(:valid_params) do
        {
          format: 'json',
          id: user.id,
          first_name: 'hrithik',
          phone_number: '9848042928'
        }
      end

      it 'updates the user with a 200 status code' do
        patch :update, valid_params
        expect(response).to have_http_status(:ok)
        result = JSON.parse(response.body)
        expect(result['errors']).to be_blank
      end
    end

    context 'when invalid details are passed' do
      let(:user2) { create(:user) }

      let(:invalid_params) do
        {
          format: 'json',
          id: user.id,
          username: user2.username,
          phone_number: '9848042928'
        }
      end

      it 'returns the errors with a 422 status code' do
        patch :update, invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
        result = JSON.parse(response.body)
        expect(result['errors']).not_to be_blank
        expect(result['errors']['username']).to eql(['has already been taken'])
      end
    end
  end

  describe 'DELETE /api/users/id' do
    let!(:params) do
      {
        format: 'json',
        id: user.id
      }
    end

    it 'destroys the user record and returns 204' do
      expect { delete :destroy, params }.to change{ User.count }.by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
