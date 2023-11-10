class InvoiceCity < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '福岡' },
    { id: 3, name: '佐賀' }
    # 他のイメージデータを追加できます
  ]

  include ActiveHash::Associations
  has_many :items
end