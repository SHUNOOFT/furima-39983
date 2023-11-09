class Item < ApplicationRecord
  validates :category_id, :condition_id,:shipping_fee_id,:shipping_city_id,:shipping_day_id, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :image_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :user
  has_one :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :image
end
