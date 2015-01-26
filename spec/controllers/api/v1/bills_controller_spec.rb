require 'rails_helper'

RSpec.describe Api::V1::BillsController do
  render_views

  describe 'GET /api/bills' do
    let(:user) do
      create(:bill).user
    end

    let(:params) do
      {
        format: 'json',
        user_id: user.id
      }
    end

    it 'returns the bills of a particular user' do
      get :index, params
      expect(response).to have_http_status(:success)
      result = JSON.parse(response.body)
      expect(result.size).to eql(1)
    end
  end

  describe 'GET /api/bills/id' do
    let(:bill) do
      bill = create(:bill_with_tags)
      payment_source = create(:payment_source, user: bill.user)
      create(:payment, bill: bill, payment_source: payment_source)
      bill
    end

    let(:params) do
      {
        format: 'json',
        id: bill.id,
        user_id: bill.user.id
      }
    end

    it 'returns the requested bill' do
      get :show, params
      expect(response).to have_http_status(:success)
      result = JSON.parse(response.body)
      expect(result['id']).to eql(bill.id)
      expect(result['payments'].size).to eql(1)
    end
  end

  describe 'POST /api/bills' do
    context 'with valid data' do
      let(:repeat_interval) { create(:repeat_interval) }
      let(:category) { create(:category) }

      let(:user) { create(:user) }

      let(:params) do
        time = 5.days.since

        {
          format: 'json',
          user_id: user.id,
          tags: ['phone', 'at&t'],
          repeat_interval: repeat_interval.id,
          next_due_date: "#{time.month}/#{time.day}/#{time.year}",
          category: category.id,
          amount: '176.50',
          name: 'AT&T'
        }
      end

      it 'creates a bill' do
        post :create, params
        expect(response).to have_http_status(:created)
        result = JSON.parse(response.body)
        expect(result['errors']).to be_blank
      end
    end

    context 'with invalid data' do
      let(:user) { create(:user) }

      let(:params) do
        time = 5.days.since

        {
          format: 'json',
          user_id: user.id,
          next_due_date: "#{time.month}/#{time.day}/#{time.year}",
          amount: '176.50',
          name: 'AT&T',
          tags: ['test', 'test1']
        }
      end

      it 'returns a 422' do
        post :create, params
        expect(response).to have_http_status(:unprocessable_entity)
        result = JSON.parse(response.body)
        expect(result['errors']).not_to be_blank
      end
    end
  end
end
