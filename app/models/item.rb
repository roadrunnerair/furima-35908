class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  belongs_to :category

  validates :item_images,                 presence: true
  validates :name,                        presence: true, length: { maximum: 40 }
  validates :item_description,            presence: true, length: { maximum: 1000 }
  validates :category_id,                 presence: true
  validates :item_condition_id,           presence: true
  validates :item_postage_id,             presence: true
  validates :prefecture_id,               presence: true
  validates :estimated_shipping_date_id,  presence: true
  validates :price,                       presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :price,                       numericality: { only_integer: true }
end