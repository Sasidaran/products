FactoryBot.define do
  factory :attachment do
    for_attachment
    
    img_path { Faker::Internet.url }
    trait :for_attachment do
      association :imageable, factory: :product
    end
  end
end
