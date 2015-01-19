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

    context 'when invalid params are passed' do
      context 'when params are missing' do
        let(:params) do
          {
            format: 'json',
            name: 'Visa 1234'
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
        let(:credit_card) { create(:credit_card) }

        let(:params) do
          {
            format: 'json',
            name: credit_card.name,
            type: 'CreditCard',
            user_id: credit_card.user.id
          }
        end

        it 'returns a 422' do
          post :create, params
          expect(response).to have_http_status(:unprocessable_entity)
          result = JSON.parse(response.body)
          expect(result['errors']['name']).to eql(['has already been taken'])
        end
      end
    end
  end

  describe 'PATCH /api/payment_sources/id' do
    context 'when valid params are passed' do
      let(:debit_card) { create(:debit_card) }
      let(:params) do
        {
          format: 'json',
          name: 'US Bank ATM Card',
          user_id: debit_card.user.id,
          id: debit_card.id
        }
      end

      it 'updates the payment source' do
        patch :update, params
        expect(response).to have_http_status(:ok)
        result = JSON.parse(response.body)
        expect(result['errors']).to be_blank
        expect(debit_card.reload.name).to eql('US Bank ATM Card')
      end
    end

    context 'when invalid params are passed' do
      let(:debit_card) { create(:debit_card) }
      let(:debit_card2) { create(:debit_card, user: debit_card.user) }
      let(:params) do
        {
          format: 'json',
          name: debit_card2.name,
          user_id: debit_card.user.id,
          id: debit_card.id
        }
      end

      it 'returns a 422' do
        patch :update, params
        expect(response).to have_http_status(:unprocessable_entity)
        result = JSON.parse(response.body)
        expect(result['errors']['name']).to eql(['has already been taken'])
      end
    end
  end

  describe 'DELETE /api/payment_sources/id' do
    let!(:debit_card) { create(:debit_card) }
    let(:params) do
      {
        id: debit_card.id,
        format: 'json'
      }
    end

    it 'destroys the payment source' do
      expect { delete :destroy, params }.to change{ PaymentSource.count }.by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
