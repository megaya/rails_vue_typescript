FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test_user_#{n}" }
    sequence(:email) { |n| "test_user_#{n}@test.com" }
    password { 'password' }
  end
end