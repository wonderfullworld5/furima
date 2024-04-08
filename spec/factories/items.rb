require 'faker'

FactoryBot.define do
  factory :item do
    user { FactoryBot.create(:user) }
    description { 'valid description' }
    category_id { 2 }
    condition_id { 2 }
    postage_id { 2 }
    area_id { 3 }
    delivery_date_id { 2 }
    price { 33_333 }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'valid_image.png'), 'image/png') }
    user_id { user.id }
  end
end

