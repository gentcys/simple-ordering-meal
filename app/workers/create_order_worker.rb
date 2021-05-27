class CreateOrderWorker
  include Sidekiq::Worker

  def perform(subscription_id)
    subscription = Subscription.find(subscription_id)

    Order.create!(subscription: subscription,
                  meal: subscription.meal,
                  deliver_at: subscription.this_week_delivery_at)
  end
end
