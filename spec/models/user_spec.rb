require 'rails_helper'

RSpec.describe User do
  describe '#create_bill' do
    context 'when the bill is recurring' do
      let(:user) { create(:user) }
      let(:params) do
        {
          amount: 100.00,
          name: 'AT&T',
          repeat_interval: create(:repeat_interval).id,
          next_due_date: Time.zone.now.strftime('%m/%d/%Y'),
          category: create(:category),
          tags: ['lol']
        }
      end

      it 'creates the only the bill' do
        user.create_bill(params)
        expect(user.bills.count).to eql(1)
        expect(user.bills.last.payments.count).to eql(0)
      end
    end

    context 'when the bill is non-recurring' do
      let(:credit_card) { create :credit_card }
      let(:user) { credit_card.user }
      let(:params) do
        {
          amount: 100.00,
          name: 'AT&T',
          repeat_interval: create(:repeat_interval, interval: 'one_time').id,
          next_due_date: Time.zone.now.strftime('%m/%d/%Y'),
          payment_source_id: credit_card.id,
          category: create(:category),
          tags: ['lol']
        }
      end

      it 'creates the bill along with the payment' do
        user.create_bill(params)
        expect(user.bills.count).to eql(1)
        expect(user.bills.last.payments.count).to eql(1)
      end
    end
  end
end
