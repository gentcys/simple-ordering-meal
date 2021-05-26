class AddDeliverAtDayOfWeekAndDeliverAtHourToSubscription < ActiveRecord::Migration[6.1]
  def change
    add_column :subscriptions, :deliver_at_day_of_week, :integer
    add_column :subscriptions, :deliver_at_hour, :integer
  end
end
