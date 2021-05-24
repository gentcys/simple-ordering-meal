# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { generate(:email) }
    password { "12345678" }
  end
end
