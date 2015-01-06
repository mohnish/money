require 'rails_helper'

RSpec.describe Api::V1::PaymentSourcesController do
  render_views

  describe 'GET /api/payment_sources', focus: true do
    let(:payment_sources) { create_list :payment_source, 2 }

    it 'returns a list of payment sources' do
      get :index, { format: 'json' }
      result = JSON.parse(response.body)
      expect(result.size).to eql(2)
      expect(response).to have_http_status(:ok)
    end
  end
end
