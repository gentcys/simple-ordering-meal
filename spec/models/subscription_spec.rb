require 'rails_helper'

RSpec.describe Subscription, type: :model do
  let!(:user) { create(:user) }
  let!(:meal) { create(:meal) }
  let!(:subscription) { create(:subscription, user: user, meal: meal) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:meal) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:meal_num) }
  it { is_expected.to validate_presence_of(:deliver_at_day_of_week) }
  it { is_expected.to validate_presence_of(:deliver_at_hour) }

  describe 'after_save callback' do
    let!(:subscription) { create(:subscription) }

    it 'generates an order' do
      order = Order.find_by(subscription_id: subscription.id)

      expect(order.subscription).to eq(subscription)
    end

    it 'increases the meal\'s rank score' do
      expect(subscription.meal.score).to eq(1)
    end
  end

  describe '#exceeds_meal_cut_off' do
    let!(:subscription) { create(:subscription, user: user, meal: meal) }

    context 'when expected deliver week day before current week day' do
      it 'returns true' do
        subscription.deliver_at_day_of_week = WeekDay.previous

        expect(subscription.exceeds_meal_cut_off?).to be_truthy
      end
    end

    context 'when expected deliver week day after meal\'s cut off' do
      it 'returns true' do
        subscription.deliver_at_day_of_week = WeekDay.next
        subscription.meal.cut_off_at_day_of_week = WeekDay.previous

        expect(subscription.exceeds_meal_cut_off?).to be_truthy
      end
    end

    context 'when expected deliver week day same as current and expected deliver hour greater than meal\'s cut off hour' do
      it 'returns true' do
        subscription.deliver_at_day_of_week = WeekDay.current_wday
        subscription.deliver_at_hour = 9
        subscription.meal.cut_off_at_time_of_day = Time.new(2000, 2, 3, 8, 0, 0, "+00:00")

        expect(subscription.exceeds_meal_cut_off?).to be_truthy
      end
    end

    context 'when expected deliver week day and hour are between current and meal cut off' do
      it 'returns false' do
        subscription.deliver_at_day_of_week = WeekDay.next
        subscription.meal.cut_off_at_day_of_week = WeekDay.next
        subscription.deliver_at_hour = 8
        subscription.meal.cut_off_at_time_of_day = Time.new(2000, 2, 3, 9, 0, 0, "+00:00")

        expect(subscription.exceeds_meal_cut_off?).to be_falsey
      end
    end
  end
end
