require 'rails_helper'

RSpec.describe Api::V1::BillsController do

  describe 'GET /api/v1/bills' do
    before do
      create :bill
    end

    it 'returns the bills of a particular user' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
