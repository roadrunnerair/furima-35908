FactoryBot.define do
  factory :mailing_address_order_history do
    postal_code      { '123-4567' }
    prefecture_id    { "26" }
    city             { "京都府" }
    house_number     { '1-1' }
    building_name    { 'カーサモリサキ308'}
    phone_number     { '00000000000' }
  end
end