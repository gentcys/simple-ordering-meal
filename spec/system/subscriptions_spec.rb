require 'rails_helper'

RSpec.describe "Subscriptions", type: :system do
  let!(:user) { create(:user) }
  let!(:meal) { create(:meal) }

  before do
    sign_in user
  end

  describe 'new subscription' do
    it 'generates an order' do
      visit meal_path(meal)
      click_link 'Subscribe'

      fill_in 'Meal num', with: 20
      fill_in 'Name', with: 'My New Subscription'
      click_button 'Create Subscription'

      subscription = Subscription.find_by(meal_id: meal.id, user_id: user.id)
      order = Order.find_by(subscription_id: subscription.id)

      expect(order.subscription.id).to eq(subscription.id)
    end

    # context 'when exceeds a meal\'s cut off' do
    #   it 'creates an order for next week' do

    #   end
    # end
  end
end
