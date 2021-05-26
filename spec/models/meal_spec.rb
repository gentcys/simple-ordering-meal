require 'rails_helper'

RSpec.describe Meal, type: :model do
  describe '#cut_off_at' do
    let(:meal) { create(:meal) }

    it 'returns formated cut_off_at' do
      cut_off_at = Meal::CUT_OFF_AT % [meal.cut_off_at_time_of_day.strftime('%H:%M'), Date::DAYNAMES[meal.cut_off_at_day_of_week]]

      expect(meal.cut_off_at).to eq(cut_off_at)
    end
  end

  describe '#exceeds_cut_off' do
    let(:meal) { create(:meal) }
    subject { meal.exceeds_cut_off? }

    context 'when current week day is after cut off week day' do
      it 'returns true' do
        meal.cut_off_at_day_of_week = Time.now.wday - 1

        expect(subject).to be_truthy
      end
    end

    context 'when current week day is before cut off week day' do
      it 'returns false' do
        meal.cut_off_at_day_of_week = Time.now.wday + 1

        expect(subject).to be_falsey
      end
    end

    context 'when current week day is as same as cut off week day' do
      let(:meal_one) { create(:meal, cut_off_at_day_of_week: Time.now.wday) }
      subject { meal_one.exceeds_cut_off? }

      context 'when current hour equals or greater than cut off hour' do
        it 'returns true' do
          meal_one.cut_off_at_time_of_day = Time.now - 1 * 60 * 60

          expect(subject).to be_truthy
        end
      end

      context 'when current hour less than cut off hour' do
        it 'returns false' do
          meal_one.cut_off_at_time_of_day = Time.now + 1 * 60 * 60

          expect(subject).to be_falsey
        end
      end
    end
  end
end
