require 'rails_helper'

RSpec.describe Bill do
  describe '#update_tags' do
    let(:bill) { create(:bill) }

    context 'when tags are provided' do
      let(:tags) { ['one', 'two', 'three'] }

      it 'creates the tags' do
        bill.update_tags(tags)
        expect(bill.tags.size).to eql(3)
        expect(bill.tags.map(&:name)).to include('one', 'two', 'three')
      end
    end

    context 'when no tags are provided' do
      let(:tags) { nil }

      it 'does not create empty tags' do
        bill.update_tags(tags)
        expect(bill.tags.size).to eql(0)
      end
    end
  end

  describe '#update_next_due_date' do
    context 'when the bill is non-recurring' do
      let(:bill) { Bill.new(repeat_interval: RepeatInterval.new(interval: 'one_time')) }

      it 'returns nil' do
        expect(bill.update_next_due_date).to be_nil
      end
    end

    context 'when the bill is recurring' do
      let(:original_date) { Time.zone.now }
      let(:bill) { create :bill, next_due_date: original_date }
      let(:expected_due_date) { original_date + 2.months }

      it 'returns the next date based on the repeat interval' do
        expect(bill.update_next_due_date).to be_truthy
        expect(bill.reload.next_due_date.strftime("%m/%d/%Y")).to eql(expected_due_date.strftime("%m/%d/%Y"))
      end
    end
  end
end
