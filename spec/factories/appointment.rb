FactoryGirl.define do
  factory :appointment do
    mentor  { FactoryGirl.create(:mentor) }
    mentee  { FactoryGirl.create(:mentee) }
    availability { FactoryGirl.create(:availability) }
  end
end
