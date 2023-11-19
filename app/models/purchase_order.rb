class PurchaseOrder
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :city, :block
    validates :user_id, :item_id
    validates :token
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :phone_number, numericality: { only_integer: true }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    order = Order.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number,purchase:purchase)
  end
end