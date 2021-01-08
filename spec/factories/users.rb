FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 5) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    prefecture_id         { 48 }
    city                  { '横浜市緑区' }
    sex_id                { 4 }
    age_id                { 9 }
  end
end