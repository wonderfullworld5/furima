# app/models/purchase_form.rb
class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :area_id, :city, :street, :building, :phone

  # バリデーションの処理
  validates :postcode, presence: true
  validates :area_id, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :phone, presence: true

  def save
    # トランザクションを用いて、以下の処理を一括で行う
    ActiveRecord::Base.transaction do
      record = Record.create(user_id: user_id, item_id: item_id)
      Ship.create(record_id: record.id, postcode: postcode, area_id: area_id, city: city, street: street, building: building, phone: phone)
    end
  end
end