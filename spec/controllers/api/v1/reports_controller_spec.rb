require 'rails_helper'

RSpec.describe Api::V1::ReportsController do
  render_views
  setup_doorkeeper

  describe 'GET /api/v1/reports' do
    context 'when no filter is passed' do
      it 'returns all the reports' do
        get :index, { format: 'json' }
        expect(response).to have_http_status(200)
        result = JSON.decode(response.body)
        expect(result).to eql(10)
      end
    end
  end
end
