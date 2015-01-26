require 'rails_helper'

RSpec.describe Api::V1::CategoriesController do
  render_views
  setup_doorkeeper

  describe 'GET /api/categories' do
    let!(:categories) { create_list :category, 4 }

    it 'returns a list of ' do
      get :index, { format: 'json' }
      expect(response).to have_http_status(:ok)
      result = JSON.parse(response.body)
      expect(result.size).to eql(4)
    end
  end
end
