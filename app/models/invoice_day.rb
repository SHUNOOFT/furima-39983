class InvoiceDay < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1~2日で発送' },
    { id: 3, name: '2~3日で発送' }
    # 他のイメージデータを追加できます
  ]

  include ActiveHash::Associations
  has_many :items
end