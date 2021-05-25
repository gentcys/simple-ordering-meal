FactoryBot.define do
  factory :subscription do
    name { "MyString" }
    user
    meal
  end
end
