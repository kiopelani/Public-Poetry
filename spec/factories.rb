FactoryGirl.define do
  factory :poem do
    title { Faker::Lorem.word }
    content { Faker::Lorem.sentence }
    votes { 0 }
  end
end