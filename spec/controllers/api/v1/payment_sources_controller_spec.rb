require 'rails_helper'

RSpec.describe Api::V1::PaymentSourcesController do
  render_views

  describe 'GET /api/payment_sources' do
    let!(:payment_sources) do
      user = create :user
      create_list :payment_source, 2, user: user
    end

    it 'returns a list of payment sources' do
      get :index, { format: 'json' }
      result = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(result.size).to eql(2)
    end
  end

  describe 'POST /api/payment_sources' do
    context 'when valid params are passed' do
      let(:user) { create(:user) }

      let(:params) do
        {
          format: 'json',
          name: 'Visa 1234',
          type: 'DebitCard',
          user_id: user.id
        }
      end

      it 'creates a payment source' do
        expect { post :create, params }.to change{ PaymentSource.count }.by(1)
        expect(response).to have_http_status(:created)
      end
    end

    context 'when invalid params are passed', focus: true do
      context 'when params are missing' do
        let(:params) do
          {
            format: 'json',
            name: 'Visa 1234',
            type: 'DebitCard'
          }
        end

        it 'returns a 422' do
          post :create, params
          expect(response).to have_http_status(:unprocessable_entity)
          result = JSON.parse(response.body)
          expect(result['errors']['user']).to eql(["can't be blank"])
        end
      end

      context 'when existing data is used' do
        it 'returns a 422' do
          post :create, {}
        end
      end
    end
  end

  describe 'PATCH /api/payment_sources/id' do
    context 'when valid params are passed' do
      it 'updates the payment source' do
        patch :update, {}
      end
    end

    context 'when invalid params are passed' do
      it 'returns a 422' do
        patch :update, {}
      end
    end
  end

  describe 'DELETE /api/payment_sources/id' do
    it 'destroys the payment source' do
      expect { delete :destroy, params }.to change{ PaymentSource.count }.by(-1)
    end
  end
end
