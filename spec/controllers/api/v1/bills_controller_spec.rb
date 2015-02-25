require 'rails_helper'

RSpec.describe Api::V1::BillsController do
  render_views
  setup_doorkeeper

  describe 'GET /api/bills' do
    let(:params) do
      create(:bill, user: user)

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
      bill = create(:bill_with_tags, user: user)
      payment_source = create(:payment_source, user: user)
      create(:payment, bill: bill, payment_source: payment_source)
      bill
    end

    let(:params) do
      {
        format: 'json',
        id: bill.id,
        user_id: user.id
      }
    end

    it 'returns the requested bill' do
      get :show, params
      expect(response).to have_http_status(:success)
      result = JSON.parse(response.body)
      expect(result['id']).to eql(bill.id)
    end
  end

  describe 'POST /api/bills' do
    context 'with valid data' do
      let(:repeat_interval) { create(:repeat_interval) }
      let(:category) { create(:category) }

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

  describe 'PATCH /api/bills/id' do
    context 'with valid params' do
      let(:bill) { create(:bill, user: user) }

      let(:params) do
        time = 15.days.since

        {
          format: 'json',
          id: bill.id,
          user_id: user.id,
          tags: ['phone', 'google', 'test'],
          next_due_date: "#{time.month}/#{time.day}/#{time.year}",
          amount: '170.00',
          name: 'T-Mobile'
        }
      end

      it 'updates the bill' do
        patch :update, params
        expect(response).to have_http_status(:ok)
        result = JSON.parse(response.body)
        bill.reload
        expect(bill.name).to eql('T-Mobile')
        expect(bill.amount).to eql(170.00)
        expect(bill.tags.map(&:name)).to include('phone', 'google', 'test')
      end
    end

    context 'with invalid params' do
      let(:bill) { create(:bill, user: user) }

      let(:params) do
        {
          format: 'json',
          id: bill.id,
          user_id: user.id,
          tags: ['phone', 'google', 'test'],
          amount: 'asd',
          name: 'T-Mobile'
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

  describe 'DELETE /api/bills/id' do
    let!(:params) do
      {
        format: 'json',
        id: create(:bill, user: user).id
      }
    end

    it 'destroys the bill record and returns 204' do
      expect { delete :destroy, params }.to change{ Bill.count }.by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
