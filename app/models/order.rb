class Order < ApplicationRecord
  belongs_to :subscription
  belongs_to :meal
end
