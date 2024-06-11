class Address < ApplicationRecord
  belongs_to :order

  validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
  validates :delivery_region_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :address_first, presence: true
  validates :phone, presence: true, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }
end