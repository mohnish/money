require 'rails_helper'

RSpec.describe Api::V1::BillsController do
  render_views

  describe 'GET /api/bills' do
    let(:user) do
      user = create(:user)
      create_list(:bill, 2, user: user)
      user
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
      expect(result.size).to eql(2)
    end
  end

  describe 'GET /api/bills/id', focus: true do
    let(:bill) do
      # FIXME: 2 users shouldn't be created.
      bill = create(:bill_with_tags)
      create(:payment, bill: bill)
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
    end
  end
end
