class Shipping < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '送料込み' },
    { id: 3, name: '着払い' }
    # 他のイメージデータを追加できます
  ]

  include ActiveHash::Associations
  has_many :items
end