class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :area_id, :city, :street, :building, :phone

  # バリデーションの設定
  validates :postcode, :area_id, :city, :street, :phone, presence: true

  # 購入データと発送先データを保存するメソッド
  def save
    return false unless valid?
    
    ActiveRecord::Base.transaction do
      record = Record.create(user_id: user_id, item_id: item_id)
      Ship.create(record_id: record.id, postcode: postcode, area_id: area_id, city: city, street: street, building: building, phone: phone)
    end
    true
  rescue ActiveRecord::RecordInvalid
    false
  end
end

