class Tag < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '衣類' },
    { id: 3, name: 'レジャー' }
    # 他のイメージデータを追加できます
  ]

  include ActiveHash::Associations
  has_many :items
end