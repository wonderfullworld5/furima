require 'rails_helper'
require 'faker'

RSpec.describe Item, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, category_id: 1, condition_id: 1, postage_id: 1, area_id: 1, delivery_date_id: 1, price: 1000, user_id: user.id)
      # 有効な画像を添付
      item.images.attach(io: File.open(Rails.root.join('spec', 'support', 'images', 'valid_image.png')),
                         filename: 'valid_image.png', content_type: 'image/png')
      expect(item).to be_valid
    end

    it "is invalid without a category" do
      item = FactoryBot.build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid without a condition" do
      item = FactoryBot.build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

    it "is invalid without a postage" do
      item = FactoryBot.build(:item, postage_id: nil)
      item.valid?
      expect(item.errors[:postage_id]).to include("can't be blank")
    end

    it "is invalid without an area" do
      item = FactoryBot.build(:item, area_id: nil)
      item.valid?
      expect(item.errors[:area_id]).to include("can't be blank")
    end

    it "is invalid without a delivery date" do
      item = FactoryBot.build(:item, delivery_date_id: nil)
      item.valid?
      expect(item.errors[:delivery_date_id]).to include("can't be blank")
    end

    it "is invalid without a price" do
      item = FactoryBot.build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "is invalid with a price less than 300" do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item, price: 299, user_id: user.id)
      item.valid?
      expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "is invalid without attached images" do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item, user_id: user.id)
      item.valid?
      expect(item.errors[:image]).to include("can't be blank")
    end

    it "is invalid without an associated user" do
      item = FactoryBot.build(:item, user_id: nil)
      item.valid?
      expect(item.errors[:user_id]).to include("can't be blank")
    end
  end
end
