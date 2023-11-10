class Condition < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '新品' },
    { id: 3, name: '未使用に近い' }
    # 他のイメージデータを追加できます
  ]

  include ActiveHash::Associations
  has_many :items
end