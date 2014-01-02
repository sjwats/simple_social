# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'El'
    last_name 'Presidente'
    sequence(:email) {|n| "the#{n}@president.com" }
    password 'password'
    password_confirmation 'password'
  end
end
