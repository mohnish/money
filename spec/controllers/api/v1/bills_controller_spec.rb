require 'rails_helper'

RSpec.describe Api::V1::BillsController do
  render_views

  describe 'GET /api/v1/bills' do
    before do
      create :bill
    end

    it 'returns the bills of a particular user' do
      get :index, format: :json
      expect(response).to have_http_status(:success)
    end
  end
end
