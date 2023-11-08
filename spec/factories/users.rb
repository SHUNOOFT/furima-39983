FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.email }
    password              { "Password1" } # 半角英字と数字を含む6文字以上のパスワード
    password_confirmation { "Password1" }
    first_name            { "太郎" }
    last_name             { "山田" }
    first_name_kana       { "タロウ" }
    last_name_kana        { "ヤマダ" }
    birthday              { Faker::Date.birthday }
  end
end