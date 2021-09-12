FactoryBot.define do
  factory :item do
    association :user

    name                          {"オムライス"}
    price                         {"700"}
    item_description              {"美味しい"}
    category_id                   { Faker::Number.between(from: 1, to: 10) }
    item_condition_id             { Faker::Number.between(from: 1, to: 6) }
    item_postage_id               { Faker::Number.between(from: 1, to: 2) }
    prefecture_id                 { Faker::Number.between(from: 1, to: 47) }
    estimated_shipping_date_id    { Faker::Number.between(from: 1, to: 3) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end