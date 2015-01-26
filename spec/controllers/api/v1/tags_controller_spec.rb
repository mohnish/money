require 'rails_helper'

RSpec.describe Api::V1::TagsController do
  render_views
  setup_doorkeeper

  describe 'POST /api/bills/bill_id/tags/' do
    context 'when valid params are passed' do
      let(:bill) { create(:bill, user: user) }
      let(:params) do
        {
          format: 'json',
          bill_id: bill.id,
          name: 'food'
        }
      end

      it 'creates a tag' do
        post :create, params
        expect(response).to have_http_status(:created)
        expect(bill.reload.tags.size).to eql(1)
      end
    end

    context 'when invalid params are passed' do
      let(:bill) do
        bill = create(:bill, user: user)
        bill.tags.create name: 'food'
        bill
      end
      let(:params) do
        {
          format: 'json',
          bill_id: bill.id,
          name: 'food'
        }
      end

      it 'returns a 422' do
        post :create, params
        expect(response).to have_http_status(:unprocessable_entity)
        expect(bill.reload.tags.size).to eql(1)
        result = JSON.parse(response.body)
        expect(result['errors']['name']).to eql(['has already been taken'])
      end
    end
  end

  describe 'DELETE /api/bills/bill_id/tags/id' do
    let!(:tag) do
      create(:tag, entity: create(:bill, user: user))
    end

    let!(:params) do
      {
        id: tag.id,
        format: 'json',
        bill_id: tag.entity.id
      }
    end

    it 'destroys the tag' do
      expect { delete :destroy, params }.to change{ Tag.count }.by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
