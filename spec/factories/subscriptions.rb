FactoryBot.define do
  factory :subscription do
    name { "MyString" }
    deliver_at_day_of_week { rand(0..6) }
    deliver_at_hour { rand(0..23) }
    meal_num { rand(1..99) }
    user
    meal
  end
end
