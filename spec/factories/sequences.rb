# frozen_string_literal: true

FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.org" }
  sequence(:random_string) { |n| "name#{n}" }
end
