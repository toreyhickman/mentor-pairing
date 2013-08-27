require 'factory_girl'

FactoryGirl.define do
  factory :mentee do
    first_name  "Lebron"
    last_name   "James"
    email       "lebron@test.com"
  end
end
