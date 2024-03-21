FactoryBot.define do
  factory :user do
    nickname { 'JohnDoe' }
    email { 'john@example.com' }
    password { Faker::Internet.password(min_length: 6, mix_case: true, special_characters: false) }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_date { Date.new(1990, 1, 1) }
  end
end
