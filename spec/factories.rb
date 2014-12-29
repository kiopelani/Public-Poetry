FactoryGirl.define do
  factory :question do
    content { Faker::Lorem.sentence}
    votes {0}
  end
end