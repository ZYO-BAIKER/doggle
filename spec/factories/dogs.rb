FactoryBot.define do
  factory :dog do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    image {Faker::Lorem.sentence}
    type_id { 2 }
    dog_sex_id  { 3 }
    association :user
  end
end
