require 'rails_helper'

RSpec.describe Api::V1::PaymentsController do
  render_views
  setup_doorkeeper

  describe 'POST /api/bills/bill_id/payments' do
    context 'when valid params are passed' do
      let(:bill) { create(:bill, user: user) }
      let(:payment_source) { create(:payment_source, user: user) }

      let(:params) do
        {
          format: 'json',
          amount: 200.12,
          payment_source_id: payment_source.id,
          bill_id: bill.id
        }
      end

      it 'creates a payment for the requested bill' do
        post :create, params
        expect(response).to have_http_status(:created)
        result = JSON.parse(response.body)
        expect(result['errors']).to be_blank
        expect(result['id']).to be_present
      end
    end

    context 'when invalid params are passed' do
      let(:bill) { create(:bill, user: user) }
      let(:payment_source) { create(:payment_source, user: user) }

      let(:params) do
        {
          format: 'json',
          payment_source_id: payment_source.id,
          bill_id: bill.id
        }
      end

      it 'returns a 422' do
        post :create, params
        expect(response).to have_http_status(:unprocessable_entity)
        result = JSON.parse(response.body)
        expect(result['id']).to be_nil
        expect(result['errors']['amount']).to eql(["is not a number", "can't be blank"])
      end
    end
  end

  describe 'PATCH /api/bills/bill_id/payments/id' do
    context 'when valid params are passed' do
      let(:payment) do
        bill = create(:bill, user: user)
        payment_source = create(:payment_source, user: user)
        create(:payment, payment_source: payment_source, bill: bill)
      end

      let(:params) do
        {
          format: 'json',
          bill_id: payment.bill.id,
          amount: 123,
          id: payment.id
        }
      end

      it 'updates the payment' do
        patch :update, params
        expect(response).to have_http_status(:ok)
        result = JSON.parse(response.body)
        expect(result['errors']).to be_blank
        expect(payment.reload.amount).to eql(123.to_d)
      end
    end

    context 'when invalid params are passed' do
      let(:payment) do
        bill = create(:bill, user: user)
        payment_source = create(:payment_source, user: user)
        create(:payment, payment_source: payment_source, bill: bill)
      end

      let(:params) do
        {
          format: 'json',
          bill_id: 'asdasd',
          amount: 123,
          id: 'ajshdkjashdk'
        }
      end

      it 'returns a 422' do
        patch :update, params
        expect(response).to have_http_status(:unprocessable_entity)
        result = JSON.parse(response.body)
        expect(result['errors']).not_to be_blank
      end
    end
  end

  describe 'DELETE /api/bills/bill_id/payments/id' do
    let!(:payment) do
      bill = create(:bill, user: user)
      payment_source = create(:payment_source, user: user)
      create(:payment, payment_source: payment_source, bill: bill)
    end

    let(:params) do
      {
        format: 'json',
        id: payment.id,
        bill_id: payment.bill.id
      }
    end

    it 'destroys the payment and returns a 204' do
      expect { delete :destroy, params }.to change{ Payment.count }.by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
