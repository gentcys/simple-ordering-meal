class AddCutOffToMeal < ActiveRecord::Migration[6.1]
  def change
    add_column :meals, :cut_off_at_day_of_week, :integer
    add_column :meals, :cut_off_at_time_of_day, :time
  end
end
