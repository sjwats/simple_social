# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'Bruce'
    last_name 'Springstein'
    sequence(:email) {|n| "the#{n}@boss.com" }
    password 'password'
    password_confirmation 'password'
  end
end
