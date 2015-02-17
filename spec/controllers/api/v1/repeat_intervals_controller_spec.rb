require 'rails_helper'

RSpec.describe Api::V1::RepeatIntervalsController do
  render_views
  setup_doorkeeper

  describe 'GET /api/repeat_intervals' do
    let!(:repeat_intervals) { create :repeat_interval }

    it 'returns a list of repeat intervals' do
      get :index, { format: 'json' }
      expect(response).to have_http_status(:ok)
      result = JSON.parse(response.body)
      expect(result.size).to eql(1)
    end
  end
end
