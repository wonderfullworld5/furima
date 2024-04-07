require 'rails_helper'
require 'faker'

RSpec.describe Item, type: :model do
  describe 'validations' do
    context 'when all attributes are valid' do
      it 'is valid with valid attributes' do
        user = FactoryBot.create(:user)
        item = FactoryBot.build(:item, user: user, description: 'valid description', category_id: 2, condition_id: 2, postage_id: 2, area_id: 3, delivery_date_id: 2, price: 33333)
        item.images.attach(io: File.open(Rails.root.join('spec', 'support', 'images', 'valid_image.png')), filename: 'valid_image.png', content_type: 'image/png')
       
        expect(item).to be_valid
      end
    end

    context 'when attributes are invalid' do
      let(:item) { FactoryBot.build(:item) }

      it 'is not valid without a name' do
        item.name = nil
        expect(item).not_to be_valid
      end

      it 'is not valid without a category' do
        item.category_id = 1
        expect(item).not_to be_valid
      end

      it 'is not valid without a condition' do
        item.condition_id = 1
        expect(item).not_to be_valid
      end

      it 'is not valid without a postage' do
        item.postage_id = 1
        expect(item).not_to be_valid
      end

      it 'is not valid without an area' do
        item.area_id = 1
        expect(item).not_to be_valid
      end

      it 'is not valid without a delivery date' do
        item.delivery_date_id = 1
        expect(item).not_to be_valid
      end

      it 'is not valid without a price' do
        item.price = nil
        expect(item).not_to be_valid
      end

      it 'is not valid with a price less than 300' do
        item.price = 299
        expect(item).not_to be_valid
      end

      it 'is not valid with a price greater than 9,999,999' do
        item.price = 10_000_000
        expect(item).not_to be_valid
      end

      it 'is not valid with a non-numeric price' do
        item.price = 'abc'
        expect(item).not_to be_valid
      end

      it 'is not valid without attached images' do
        expect(item).not_to be_valid
      end
    end

    context 'when user is not associated' do
      let(:item) { FactoryBot.build(:item, user: nil) }

      it 'is not valid without a user' do
        expect(item).not_to be_valid
      end
    end

    context 'when item is created without images' do
      let(:item) { FactoryBot.build(:item) }

      it 'is not valid without attached images' do
        expect(item).not_to be_valid
      end
    end
  end
end
