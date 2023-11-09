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

end
