FactoryGirl.define do
  factory :user do
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
    end
  end
end
