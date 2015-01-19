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

  describe 'GET /api/bills/id' do
    let(:bill) { create :bill }

    it 'returns the requested bill' do
      get :show, params.merge(id: bill.id)
      expect(response).to have_http_status(:success)
      result = JSON.parse(response.body)
      expect(result['id']).to eql(bill.id)
    end
  end
end
