require 'rails_helper'

RSpec.describe "Meals", type: :system do
  describe 'GET /meals' do
    let!(:meal_1) { create(:meal) }
    let!(:meal_2) { create(:meal) }
    let!(:meal_3) { create(:meal) }

    it 'shows all meals' do
      visit meals_path

      expect(page).to have_content(meal_1.name)
      expect(page).to have_content(meal_2.name)
      expect(page).to have_content(meal_3.name)
    end
  end
end
