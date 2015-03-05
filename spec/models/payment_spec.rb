require 'rails_helper'

RSpec.describe Payment do
  describe '#update_bill_attributes' do
    context 'when the bill is non-recurring' do
      let(:payment) do
        payment = create(:payment)
        payment.bill.update(repeat_interval: create(:repeat_interval, interval: 'one_time'))
        payment
      end

      it 'marks the bill as inactive' do
        payment.update_bill_attributes
        expect(payment.bill.inactive?).to be_truthy
      end
    end

    context 'when the bill is recurring' do
      let(:payment) { create(:payment) }

      it 'updates the bills due date' do
        payment.update_bill_attributes
        expect(payment.bill.next_due_date.strftime('%m/%d/%Y')).to eql(2.months.since.strftime('%m/%d/%Y'))
      end
    end
  end
end
