class Subscription < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :meal_num

  belongs_to :user
  belongs_to :meal

  after_save :generate_order

  def generate_order
    Order.create!(subscription: self, meal: meal)
  end
end
