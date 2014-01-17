# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    sequence(:name) {|n| "Fo#{n}osball" }
  end
end
