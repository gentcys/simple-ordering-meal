require 'rails_helper'

RSpec.describe Meal, type: :model do
  describe '#cut_off_at' do
    let(:meal) { create(:meal) }

    it 'returns formated cut_off_at' do
      cut_off_at = Meal::CUT_OFF_AT % [meal.cut_off_at_time_of_day.strftime('%H:%M'), Date::DAYNAMES[meal.cut_off_at_day_of_week - 1]]

      expect(meal.cut_off_at).to eq(cut_off_at)
    end
  end
end
