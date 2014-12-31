require 'rails_helper'

RSpec.describe Api::V1::BillsController do
  render_views

  let(:params) { { format: :json } }

  describe 'GET /api/bills' do
    before do
      create :bill
    end

    it 'returns the bills of a particular user' do
      get :index, params
      expect(response).to have_http_status(:success)
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
