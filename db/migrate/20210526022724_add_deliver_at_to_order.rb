class AddDeliverAtToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :deliver_at, :timestamp
  end
end
