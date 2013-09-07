FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "User #{n}" }
    sequence(:last_name) { |n| "The #{n}th" }
    sequence(:email) { |n| "user-#{n}@example.com" }
    sequence(:twitter_handle) { |n| "@user_#{n}" }

    factory :mentee do
      first_name  "Lebron"
      last_name   "James"
      email       "lebron@example.com"
      twitter_handle "@mentee"
    end

    factory :mentor do
      first_name  "Erik"
      last_name   "Allar"
      email       "erik@example.com"
      twitter_handle "@mentor"
      activated true
    end
  end
end
