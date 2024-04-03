RSpec.describe Item, type: :model do
  describe 'validations' do
    before do
      @item = FactoryBot.build(:item)
    end

    context 'when all attributes are valid' do
      it 'is valid with valid attributes' do
        expect(@item).to be_valid
      end
    end

    context 'when attributes are invalid' do
      it 'is not valid without a name' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'is not valid without a description' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'is not valid without a category' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'is not valid without a condition' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'is not valid without a shipping_fee' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it 'is not valid without a prefecture' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it 'is not valid without shipping_days' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end

      it 'is not valid without a price' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'is not valid with a price less than 300' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'is not valid with a price greater than 9,999,999' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'is not valid with a non-numeric price' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'is not valid without a user' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it 'is not valid without attached images' do
        @item.images.attach(io: File.open('/path/to/invalid/image.png'), filename: 'image.png', content_type: 'image/png')
        @item.valid?
        expect(@item.errors.full_messages).to include("Images must be attached")
      end
    end
  end
end
