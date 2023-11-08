class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, presence: true

  validates :first_name_kana, :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "はカタカナで入力してください" }
  validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は漢字、ひらがな、カタカナのみを含めてください" }

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
