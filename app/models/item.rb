class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_region
  belongs_to :delivery_day

  has_one_attached :image
  belongs_to :user
  # has_one :order
  

  validates :image,               presence: true
  validates :item_name,           presence: true
  validates :item_describe,       presence: true
  validates :price,               presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id,                         numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,                        numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id,                  numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_region_id,                  numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id,                     numericality: { other_than: 1, message: "can't be blank" }
end
