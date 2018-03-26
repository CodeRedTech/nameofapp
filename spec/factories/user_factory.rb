FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com" }
  factory :user do
    email 
    password 
    first_name 
    last_name
    admin false
  end
end
