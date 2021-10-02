class MailingAddressOrderHistory
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :order_history, :user_id, :item_id, :token

  with_options presence: true do
   validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
   validates :prefecture_id
   validates :city
   validates :house_number
   validates :phone_number, numericality: { only_integer: true }
   validates :user_id
   validates :item_id
   validates :token
  end

  with_options numericality: { other_than: 0, message: "can't be blank"} do
    validates :prefecture_id
  end

  def save
    order_history = OrderHistory.create(user_id: user_id, item_id: item_id)
    MailingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city,
      house_number: house_number, building_name: building_name, phone_number: phone_number, order_history_id: order_history.id)
  end

end