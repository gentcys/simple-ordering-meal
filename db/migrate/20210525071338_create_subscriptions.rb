class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.integer :meal_num
      t.references :user, null: false
      t.references :meal, null: false

      t.timestamps
    end
  end
end
