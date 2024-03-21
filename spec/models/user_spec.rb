require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(
      nickname: 'test_user',
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123',
      last_name: '山田',
      first_name: '太郎',
      last_name_kana: 'ヤマダ',
      first_name_kana: 'タロウ',
      birth_date: Date.new(2000, 1, 1)
    )
    expect(user).to be_valid
  end

  it 'is not valid without a nickname' do
    user = User.new(nickname: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without an email' do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid with a duplicate email address' do
    User.create(
      nickname: 'existing_user',
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123',
      last_name: '山田',
      first_name: '太郎',
      last_name_kana: 'ヤマダ',
      first_name_kana: 'タロウ',
      birth_date: Date.new(2000, 1, 1)
    )
    user = User.new(email: 'test@example.com')
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = User.new(password: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid with a password less than 6 characters' do
    user = User.new(password: '12345')
    expect(user).to_not be_valid
  end

  it 'is not valid with a password containing only letters' do
    user = User.new(password: 'abcdefgh')
    expect(user).to_not be_valid
  end

  it 'is not valid with a password containing only digits' do
    user = User.new(password: '123456')
    expect(user).to_not be_valid
  end

  it 'is not valid with a password containing full-width characters' do
    user = User.new(password: 'ｐａｓｓｗｏｒｄ１２３')
    expect(user).to_not be_valid
  end

  it 'is not valid with different password and password confirmation' do
    user = User.new(
      password: 'password123',
      password_confirmation: 'wrong_password'
    )
    expect(user).to_not be_valid
  end

  it 'is not valid without a last name' do
    user = User.new(last_name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid with half-width characters in last name' do
    user = User.new(last_name: 'Yamada')
    expect(user).to_not be_valid
  end

  it 'is not valid without a first name' do
    user = User.new(first_name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid with half-width characters in first name' do
    user = User.new(first_name: 'Taro')
    expect(user).to_not be_valid
  end

  it 'is not valid without a last name kana' do
    user = User.new(last_name_kana: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid with characters other than katakana in last name kana' do
    user = User.new(last_name_kana: 'やまだ')
    expect(user).to_not be_valid
  end

  it 'is not valid without a first name kana' do
    user = User.new(first_name_kana: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid with characters other than katakana in first name kana' do
    user = User.new(first_name_kana: 'たろう')
    expect(user).to_not be_valid
  end

  it 'is not valid without a birth date' do
    user = User.new(birth_date: nil)
    expect(user).to_not be_valid
  end
end
