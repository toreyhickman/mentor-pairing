require 'factory_girl'

FactoryGirl.define do
  factory :availability do
    start_time  DateTime.new(2014, 1, 1)
    association :mentor, factory: :mentor
    timezone "UTC"
  end
end
