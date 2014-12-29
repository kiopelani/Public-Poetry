FactoryGirl.define do
  factory :poem do
    content { Faker::Lorem.sentence}
    votes {0}
  end
end