FactoryBot.define do
  factory :product do
    name { Faker::Lorem.word }
    sku_id { Faker::Alphanumeric.unique.alphanumeric(5) }
    description { Faker::Lorem.sentence }
    price { Faker::Number.number(8) }
    expire_date { Faker::Date.forward(30) }

    after(:build) do
      #product.attachments = build(:attachment, imageable: product)
    end
  end
end
