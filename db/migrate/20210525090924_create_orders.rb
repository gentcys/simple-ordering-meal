class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :subscription, null: false
      t.references :meal, null: false

      t.timestamps
    end
  end
end
