class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :area_id, :city, :street, :building, :phone

  # バリデーションを追加
  validates :postcode, presence: true
  validates :area_id, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :phone, presence: true

  # 保存処理
  def save
    # 購入情報を保存
    record = Record.create(user_id: user_id, item_id: item_id)

    # 発送先情報を保存
    Ship.create(record_id: record.id, postcode: postcode, area_id: area_id, city: city, street: street, building: building, phone: phone)
  end
end
