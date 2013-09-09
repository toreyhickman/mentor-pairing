require 'factory_girl'

FactoryGirl.define do
  factory :availability do
    timezone "UTC"
    duration 30
    start_time  DateTime.new(2014, 1, 1)
    association :mentor, factory: :mentor
  end
end
