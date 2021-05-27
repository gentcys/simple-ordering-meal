# frozen_string_literal: true

class Subscription < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :meal_num
  validates_presence_of :deliver_at_day_of_week
  validates_presence_of :deliver_at_hour

  belongs_to :user
  belongs_to :meal

  has_many :orders

  after_save :generate_order
  after_save :increase_meal_score

  def generate_order
    Order.create!(subscription: self, meal: meal, deliver_at: order_deliver_at)
  end

  def increase_meal_score
    meal.increment!(:score)
  end

  def exceeds_meal_cut_off?
    return true if WeekDay.current_wday >= deliver_at_day_of_week
    return true if deliver_at_day_of_week > meal.cut_off_at_day_of_week

    if deliver_at_day_of_week == meal.cut_off_at_day_of_week && deliver_at_hour >= meal.cut_off_at_time_of_day.hour
      return true
    end

    false
  end

  def this_week_delivery_at
    today = Date.today

    deliver_day = today + (deliver_at_day_of_week - WeekDay.wday(today))

    Time.new(deliver_day.year, deliver_day.month, deliver_day.day, deliver_at_hour).utc
  end

  def order_deliver_at
    return (this_week_delivery_at + 7.days) if exceeds_meal_cut_off?

    this_week_delivery_at
  end

  def self.without_generated_order_for_week(week_period)
    order_generated_subscription_ids = Order.in_week_period(week_period).pluck(:subscription_id)

    sql = includes(:meal).where('created_at < ?', week_period.beginning)
    sql.where.not(id: order_generated_subscription_ids) unless order_generated_subscription_ids.empty?
  end
end
