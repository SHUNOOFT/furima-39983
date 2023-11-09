class Image < ApplicationRecord
  self.data = [
    { id: 1, name: 'Image 1' },
    { id: 2, name: 'Image 2' },
    { id: 3, name: 'Image 3' },
    { id: 4, name: 'Image 4' },
    { id: 5, name: 'Image 5' },
    { id: 6, name: 'Image 6' }
    # 他のイメージデータを追加できます
  ]
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item

  validates :category_id, :condition_id,:shipping_fee_id,:shipping_city_id,:shipping_day_id, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :image_id, numericality: { other_than: 1 , message: "can't be blank"}
end
