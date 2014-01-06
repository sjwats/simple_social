FactoryGirl.define do
  factory :contact do
    first_name 'First'
    last_name 'Last'
    email 'example@example.com'
    subject 'subject line'
    description 'so much description'
  end
end
