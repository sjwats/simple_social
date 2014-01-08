# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'Silvestor'
    last_name 'Stallone'
    sequence(:email) {|n| "the#{n}@stallone.com" }
    password 'password'
    password_confirmation 'password'
  end
end
