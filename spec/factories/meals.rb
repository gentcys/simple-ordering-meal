FactoryBot.define do
  factory :meal do
    name { generate(:random_string) }
    price { rand(1.01..20.99) }
    cut_off_at_day_of_week { rand(0..6) }
    cut_off_at_time_of_day { Time.now }
  end
end
