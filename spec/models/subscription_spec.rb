require 'rails_helper'

RSpec.describe Subscription, type: :model do
  let!(:user) { create(:user) }
  let!(:meal) { create(:meal) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:meal) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:meal_num)}

  describe 'after_save callback' do
    let(:subscription) { create(:subscription) }

    it 'generates an order' do
      order = Order.find_by(subscription_id: subscription.id)

      expect(order.subscription).to eq(subscription)
    end
  end
end
