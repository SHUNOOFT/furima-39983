class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :charge_id
  belongs_to :prefecture_id
  belongs_to :shipping_date_id

  validates :image, :title,:info, :category_id, :charge_id,:prefecture_id, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :condition_id, :charge_id, :prefecture_id, :shipping_date_id, numericality: { other_than: 1, message: "can't be blank"}

  belongs_to :user
  has_one :purchase
end
