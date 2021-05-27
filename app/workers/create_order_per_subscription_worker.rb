class CreateOrderPerSubscriptionWorker
  include Sidekiq::Worker

  def perform
    current_week = WeekPeriod.current

    subscriptions = Subscription.without_generated_order_for_week(current_week)

    subscriptions.each do |s|
      cut_off_at = WeekDay.new(s.meal.cut_off_at_day_of_week).to_time(
        s.meal.cut_off_at_time_of_day.hour,
        s.meal.cut_off_at_time_of_day.minute,
        s.meal.cut_off_at_time_of_day.second
      )

      CreateOrderWorker.perform_at(cut_off_at, s.id)
    end
  end
end
