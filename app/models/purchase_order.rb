class PurchaseOrder
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :city, :block
    validates :user_id, :item_id
    validates :token
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "should be 10 or 11 digits" }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  validate :validate_phone_number_format

  def validate_phone_number_format
    unless phone_number.to_s.match?(/\A\d{10,11}\z/)
      errors.add(:phone_number, "should be 10 or 11 digits") unless errors[:phone_number].include?("should be 10 or 11 digits")
      errors.add(:phone_number, "is not a number") unless errors[:phone_number].include?("is not a number")
    end
  end

  def save
    purchase = Purchase.new(user_id: user_id, item_id: item_id)
    order = Order.new(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchase: purchase)

    unless purchase.valid?
      errors.merge!(purchase.errors)
    end

    unless order.valid?
      errors.merge!(order.errors)
    end

    if errors.empty?
      purchase.save
      order.save
      true
    else
      false
    end
  end
end