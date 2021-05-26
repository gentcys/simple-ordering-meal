FactoryBot.define do
  factory :subscription do
    name { "MyString" }
    meal_num { rand(1..99) }
    user
    meal
  end
end
