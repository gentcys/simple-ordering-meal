require 'rails_helper'
require 'sidekiq/testing'

Sidekiq::Testing.fake!

RSpec.describe CreateOrderWorker, type: :worker do
  let!(:subscription) { create(:subscription) }

  it 'creates an order' do
    expect {
      described_class.new.perform(subscription.id)
    }.to change { Order.count }
  end
end
