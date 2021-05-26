class AddScoreToMeal < ActiveRecord::Migration[6.1]
  def change
    add_column :meals, :score, :integer
  end
end
