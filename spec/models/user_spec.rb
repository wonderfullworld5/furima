require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録できる時' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@user).to be_valid
      end
      it 'emailが@を含めば登録できる' do
        user = FactoryBot.build(:user, email: 'test@example.com')
        expect(user).to be_valid
      end
      it 'nicknameが10文字以下なら登録できる' do
          expect(@user).to be_valid
        end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        user = FactoryBot.build(:user, password: 'ab1234', password_confirmation: 'ab1234')
        expect(user).to be_valid
      end
      it '姓（カナ）がカタカナの場合は登録できる' do
        user = FactoryBot.build(:user, last_name_kana: 'ヤマダ')
        expect(user).to be_valid
      end
      it '名（カナ）がカタカナの場合は登録できる' do
        user = FactoryBot.build(:user, first_name_kana: 'タロウ')
        expect(user).to be_valid
      end
      it '生年月日が空でなければ登録できる' do
        user = FactoryBot.build(:user, birth_date: '1990-01-01')
        expect(user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'ニックネームが空では登録できない' do
        user = FactoryBot.build(:user, nickname: '')
        user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空では登録できない' do
        user = FactoryBot.build(:user, email: '')
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが正しくない場合は登録できない' do
        user = FactoryBot.build(:user, email: 'test')
        user.valid?
        expect(user.errors.full_messages).to include("Email is invalid")
      end
      it '重複したメールアドレスの場合は登録できない' do
        user = FactoryBot.create(:user)
        another_user = FactoryBot.build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailが@を含まないと登録できない' do
        user = FactoryBot.build(:user, email: 'testexample.com')
        user.valid?
        expect(user.errors.full_messages).to include("Email is invalid")
      end
      it 'パスワードが空では登録できない' do
        user = FactoryBot.build(:user, password: '')
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが5文字以下では登録できない' do
        user = FactoryBot.build(:user, password: '12345', password_confirmation: '12345')
        user.valid?
        expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードとパスワード確認が一致しないと登録できない' do
        user = FactoryBot.build(:user, password_confirmation: 'mismatch')
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '姓が空では登録できない' do
        user = FactoryBot.build(:user, last_name: '')
        user.valid?
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end
      it '姓（カナ）にカタカナ以外の文字が含まれる場合は登録できない' do
        user = FactoryBot.build(:user, last_name_kana: 'やまだ')
        user.valid?
        expect(user.errors.full_messages).to include("Last name kana is invalid")
      end
      it '名が空では登録できない' do
        user = FactoryBot.build(:user, first_name: '')
        user.valid?
        expect(user.errors.full_messages).to include("First name can't be blank")
      end
      it '名（カナ）が空では登録できない' do
        user = FactoryBot.build(:user, first_name_kana: '')
        user.valid?
        expect(user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '名（カナ）にカタカナ以外の文字が含まれる場合は登録できない' do
        user = FactoryBot.build(:user, first_name_kana: 'たろう')
        user.valid?
        expect(user.errors.full_messages).to include("First name kana is invalid")
      end
      it '生年月日が空だと登録できない' do
        user = FactoryBot.build(:user, birth_date: '')
        user.valid?
        expect(user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end