class OrderAddress
  include ActiveModel::Model

  attr_accessor :post_code, :delivery_region_id, :city, :address_first, :address_second, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :delivery_region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address_first
    validates :phone, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, delivery_region_id: delivery_region_id, address_first: address_first,
                   address_second: address_second, city: city, phone: phone, order_id: order.id)
  end
end
