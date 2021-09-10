class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :item_condition
  belongs_to :item_postage
  belongs_to :prefecture
  belongs_to :estimated_shipping_date


  with_options presence: true do
    validates :image
    validates :name,              length: { maximum: 40 }
    validates :item_description,  length: { maximum: 1000 }
    validates :price, numericality: { message: 'is invalid. Input half-width characters.', 
      only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :item_condition_id
    validates :item_postage_id
    validates :prefecture_id
    validates :estimated_shipping_date_id
  end
end