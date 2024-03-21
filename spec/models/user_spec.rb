# spec/models/user_spec.rb

require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '異常な場合' do
    it 'ニックネームがない場合、無効であること' do
      @user.nickname = nil
      expect(@user).to_not be_valid
    end

    it 'メールアドレスがない場合、無効であること' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'メールアドレスに@が含まれない場合、無効であること' do
      @user.email = 'testexample.com'
      expect(@user).to_not be_valid
    end

    it '重複したメールアドレスの場合、無効であること' do
      # 重複するメールアドレスを持つユーザーを作成
      FactoryBot.create(:user, email: 'test@example.com')
      @user.email = 'test@example.com'
      expect(@user).to_not be_valid
    end

    it 'パスワードがない場合、無効であること' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'パスワードが6文字未満の場合、無効であること' do
      @user.password = '12345'
      expect(@user).to_not be_valid
    end

    it 'パスワードが全て文字の場合、無効であること' do
      @user.password = 'abcdefgh'
      expect(@user).to_not be_valid
    end

    it 'パスワードが全て数字の場合、無効であること' do
      @user.password = '123456'
      expect(@user).to_not be_valid
    end

    it 'パスワードに全角文字が含まれる場合、無効であること' do
      @user.password = 'ｐａｓｓｗｏｒｄ１２３'
      expect(@user).to_not be_valid
    end

    it 'パスワードとパスワード確認が一致しない場合、無効であること' do
      @user.password_confirmation = 'wrong_password'
      expect(@user).to_not be_valid
    end

    it '姓がない場合、無効であること' do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it '姓に半角文字が含まれる場合、無効であること' do
      @user.last_name = 'Yamada' # 全角文字に修正
      expect(@user).to_not be_valid
    end

    it '名がない場合、無効であること' do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it '名に半角文字が含まれる場合、無効であること' do
      @user.first_name = 'Taro' # 全角文字に修正
      expect(@user).to_not be_valid
    end

    it '姓のフリガナがない場合、無効であること' do
      @user.last_name_kana = nil
      expect(@user).to_not be_valid
    end

    it '姓のフリガナにカタカナ以外の文字が含まれる場合、無効であること' do
      @user.last_name_kana = 'やまだ'
      expect(@user).to_not be_valid
    end

    it '名のフリガナがない場合、無効であること' do
      @user.first_name_kana = nil
      expect(@user).to_not be_valid
    end

    it '名のフリガナにカタカナ以外の文字が含まれる場合、無効であること' do
      @user.first_name_kana = 'たろう'
      expect(@user).to_not be_valid
    end

    it '誕生日がない場合、無効であること' do
      @user.birth_date = nil
      expect(@user).to_not be_valid
    end
  end
end

