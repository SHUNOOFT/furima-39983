class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_fee
  belongs_to :shipping_day

  validates :image, :title, :info, :category_id, :condition_id, :prefecture_id, :shipping_fee_id, :shipping_day_id, :price, presence: true

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :condition_id, :prefecture_id, :shipping_fee_id, :shipping_day_id, numericality: { other_than: 1, message: "can't be blank"}

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  
end