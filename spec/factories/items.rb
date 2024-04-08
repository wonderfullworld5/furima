require 'faker'

FactoryBot.define do
  factory :item do
    association :user  #出品者
    description { 'valid description' }
    category_id { 2 }
    condition_id { 2 }
    postage_id { 2 }
    area_id { 2 }
    delivery_date_id { 2 }
    price { 1000 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/valid_image.png'), filename: 'valid_image.png')
    end
  end
end
