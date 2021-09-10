FactoryBot.define do
  factory :item do
    name                          {"オムライス"}
    price                         {"700"}
    item_description              {"美味しい"}
    user                          {"1"}
    category_id                   {"1"}
    item_condition_id             {"1"}
    item_postage_id               {"1"}
    prefecture_id                 {"1"}
    estimated_shipping_date_id    {"1"}
  end

  factory :item_image do
    image                         {"sample.jpg"}
  end
end