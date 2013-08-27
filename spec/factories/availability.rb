require 'factory_girl'

FactoryGirl.define do
  factory :availability do
    date        Date.today
    start_time  Time.new(2014, 1, 1)
    association :mentor, factory: :mentor
  end
end
