FactoryGirl.define do
  factory :user do
    first_name "User"
    sequence(:last_name) { |n| "The #{n}th" }
    sequence(:email) { |n| "user-#{n}@example.com" }
    sequence(:twitter_handle) { |n| "@user_#{n}" }

    factory :mentee do
      first_name  "Mentee"
      sequence(:email) { |n| "mentee-#{n}@example.com" }
      sequence(:twitter_handle) { |n| "@mentee-#{n}" }
    end

    factory :mentor do
      first_name  "Mentor"
      sequence(:email) { |n| "mentor-#{n}@example.com" }
      sequence(:twitter_handle) { |n| "@mentor-#{n}" }
      activated true
    end
  end
end
