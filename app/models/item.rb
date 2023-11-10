class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tag
  belongs_to :condition
  belongs_to :shipping
  belongs_to :invoice_city
  belongs_to :invoice_day

  validates :image, :title, :info, :tag_id, :condition_id, :shipping_id, :invoice_city_id, :invoice_day_id, :price, presence: true

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :tag_id, :condition_id, :shipping_id, :invoice_city_id, :invoice_day_id, :price, numericality: { other_than: 1, message: "can't be blank"}

end