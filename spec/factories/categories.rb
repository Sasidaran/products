FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    code { Faker::Lorem.sentence(2) }
  end
end
