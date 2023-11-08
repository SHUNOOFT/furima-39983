require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '正常系テスト' do
      it '全ての項目が正しい場合、登録できること' do
        expect(@user).to be_valid
      end
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it '名字が空欄の場合、エラーが表示されること' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it '名前が空欄の場合、エラーが表示されること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it '名字（カナ）が空欄の場合、エラーが表示されること' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it '名前（カナ）が空欄の場合、エラーが表示されること' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it '英字のみのパスワードでは登録できないこと' do
      @user.password = 'password' # 英字のみのパスワード
      @user.password_confirmation = 'password'
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end
    it '数字のみのパスワードでは登録できないこと' do
      @user.password = '123456' # 数字のみのパスワード
      @user.password_confirmation = '123456'
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end
    it '生年月日が必須であること' do
      @user.birthday = nil # 生年月日を nil に設定
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'パスワード１２３' # パスワードに全角文字を含む
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end
    it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.last_name = 'Yamada' # 姓に半角文字を含む
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name は漢字、ひらがな、カタカナのみを含めてください')
    end
    it '名（全角）に半角文字が含まれていると登録できない' do
      @user.first_name = 'Taro' # 名に半角文字を含む
      @user.valid?
      expect(@user.errors.full_messages).to include('First name は漢字、ひらがな、カタカナのみを含めてください')
    end
    it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.last_name_kana = 'やまだ' # 姓（カナ）に平仮名を含む
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana はカタカナで入力してください')
    end
    it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.first_name_kana = 'たろう' # 名（カナ）に平仮名を含む
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana はカタカナで入力してください')
    end
  end
end