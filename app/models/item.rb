class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  belongs_to :category

  validates :image,                       presence: true
  validates :name,                        presence: true, length: { maximum: 40 }
  validates :item_description,            presence: true, length: { maximum: 1000 }
  validates :category_id,                 numericality: { other_than: 1, message: "can't be blank" }
  validates :item_condition_id,           numericality: { other_than: 1, message: "can't be blank" }
  validates :item_postage_id,             numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,               numericality: { other_than: 1, message: "can't be blank" }
  validates :estimated_shipping_date_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :price,                       numericality: { other_than: 1, message: "can't be blank" }
  validates :price,                       numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price,                       numericality: { other_than: 1, message: 'is invalid. Input half-width characters.' }
end
