class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :area_id, :city, :street, :building, :phone

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :area_id, numericality: { other_than: 0 }
    validates :city
    validates :street
    validates :phone, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Ship.create(record_id: record.id, postcode: postcode, area_id: area_id, city: city, street: street, building: building, phone: phone)
  end
end

