FactoryBot.define do
  factory :item do
    association :user
    title       { "商品名（必須 40文字まで)" }
    info        { "2023年頃に1万円で購入したジャケットです。ライトグレーで傷はありません。" }
    category_id { Faker::Number.between(from: 2, to: 10) }
    condition_id { Faker::Number.between(from: 2, to: 10) }
    prefecture_id { Faker::Number.between(from: 2, to: 10) }
    shipping_fee_id { Faker::Number.between(from: 2, to: 10) }
    shipping_day_id { Faker::Number.between(from: 2, to: 10) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec', 'test_image', 'test.jpg')), filename: 'test.png')
    end
  end
end