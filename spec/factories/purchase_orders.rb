FactoryBot.define do
  factory :purchase_order do
    postcode { '123-4567' }
    prefecture_id { 1 }
    city { 'Example City' }
    block { 'Example Block' }
    building { 'Example Building' }
    phone_number { '09012345678' }
    user_id { 1 }
    item_id { 1 }
    token { 1 }


    trait :without_postcode do
      postcode { nil }
    end

    trait :without_prefecture_id do
      prefecture_id { nil }
    end
  end
end