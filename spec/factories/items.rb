require 'faker'

FactoryBot.define do
  factory :item do
    user { FactoryBot.create(:user) }
    description { 'valid description' }
    category_id { 1 }
    condition_id { 1 }
    postage_id { 1 }
    area_id { 1 }
    delivery_date_id { 1 }
    price { 1000 }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'valid_image.png'), 'image/png') }
    user_id { user.id }
  end
end
