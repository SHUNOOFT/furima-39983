class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tag_id
  belongs_to :info
  belongs_to :condition_id
  belongs_to :price
  belongs_to :prefecture_id

  validates :image, :title, :info, :tag_id, :condition_id, :prefecture_id, :invoice_city_id, :invoice_day_id, :price, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :title, :info, :tag_id, :condition_id, :prefecture_id, :invoice_city_id, :invoice_day_id, :price,numericality: { other_than: 1, message: "can't be blank"}

  belongs_to :user
  has_one :purchase
end