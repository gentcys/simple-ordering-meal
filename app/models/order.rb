class Order < ApplicationRecord
  belongs_to :subscription
  belongs_to :meal

  scope :in_week_period, ->(week_period) { where('deliver_at BETWEEN ? AND ?', week_period.beginning, week_period.end) }
end
