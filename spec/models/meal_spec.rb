require 'rails_helper'

RSpec.describe Meal, type: :model do
  describe '#cut_off_at' do
    let(:meal) { create(:meal) }

    it 'returns formated cut_off_at' do
      cut_off_at = Meal::CUT_OFF_AT % [meal.cut_off_at_time_of_day.strftime('%H:%M'), Date::DAYNAMES.rotate[meal.cut_off_at_day_of_week]]

      expect(meal.cut_off_at).to eq(cut_off_at)
    end
  end

  describe '#exceeds_cut_off' do
    let(:meal) { create(:meal) }
    subject { meal.exceeds_cut_off? }

    context 'when current week day is after cut off week day' do
      it 'returns true' do
        meal.cut_off_at_day_of_week = WeekDay.current_wday - 1

        expect(subject).to be_truthy
      end
    end

    context 'when current week day is before cut off week day' do
      it 'returns false' do
        meal.cut_off_at_day_of_week = WeekDay.current_wday + 1

        expect(subject).to be_falsey
      end
    end

    context 'when current week day is as same as cut off week day' do
      let(:meal_one) { create(:meal, cut_off_at_day_of_week: WeekDay.current_wday) }
      let(:now) { Time.now.utc }
      subject { meal_one.exceeds_cut_off? }

      context 'when current hour equals or greater than cut off hour' do
        it 'returns true' do
          meal_one.cut_off_at_time_of_day = now.hour == 0 ? now : now - 1.hour

          expect(subject).to be_truthy
        end
      end

      context 'when current hour less than cut off hour' do
        it 'returns false' do
          meal_one.cut_off_at_time_of_day = now.hour == 23 ? now : now + 1.hour

          expect(subject).to be_falsey
        end
      end
    end
  end

  describe '.most_popular' do
    before do
      10.times { |n| create(:meal, score: n) }
    end

    it 'returns meals order by score in descending' do
      meals = described_class.most_popular

      expect(meals.first.score).to eq(9)
      expect(meals.last.score).to eq(0)
    end

    context 'without limit' do
      meals = described_class.most_popular

      it 'returns by default limit' do
        expect(meals.count).to eq(10)
      end
    end

    context 'with limit' do
      meals = described_class.most_popular(limit: 5)

      it 'returns by specified limit' do
        expect(meals.count).to eq(5)
      end
    end
  end
end
