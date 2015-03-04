require 'rails_helper'

RSpec.describe RepeatInterval do
  describe '#one_time?' do
    let(:repeat_interval) { RepeatInterval.new(interval: 'one_time') }

    it 'returns true' do
      expect(repeat_interval.one_time?).to be_truthy
    end
  end

  describe '#daily?' do
    let(:repeat_interval) { RepeatInterval.new(interval: '1_day') }

    it 'returns true' do
      expect(repeat_interval.daily?).to be_truthy
    end
  end

  describe '#weekly?' do
    let(:repeat_interval) { RepeatInterval.new(interval: '1_week') }

    it 'returns true' do
      expect(repeat_interval.weekly?).to be_truthy
    end
  end

  describe '#bimonthly?' do
    let(:repeat_interval) { RepeatInterval.new(interval: '2_week') }

    it 'returns true' do
      expect(repeat_interval.bimonthly?).to be_truthy
    end
  end

  describe '#monthly?' do
    let(:repeat_interval) { RepeatInterval.new(interval: '1_month') }

    it 'returns true' do
      expect(repeat_interval.monthly?).to be_truthy
    end
  end

  describe '#yearly?' do
    let(:repeat_interval) { RepeatInterval.new(interval: '1_year') }

    it 'returns true' do
      expect(repeat_interval.yearly?).to be_truthy
    end
  end

  describe '#calculate_next_due_date' do
    let(:repeat_interval) { RepeatInterval.new(months: 2) }

    context 'when the current due date is invalid' do
      it 'returns nil' do
        expect(repeat_interval.calculate_next_due_date(nil)).to eql(nil)
      end
    end

    context 'when the current due date is valid' do
      let(:current_due_date) { Time.zone.now }

      it 'returns the next due date' do
        expect(repeat_interval.calculate_next_due_date(current_due_date)).to eql(current_due_date + 2.months)
      end
    end
  end
end
