class Ship < ApplicationRecord
  belongs_to :record

  # バリデーション
  validates :postcode, presence: true, format: { with: /\A\d{3}-\d{4}\z/}
  validates :area_id, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :phone, presence: true, format: { with: /\A\d{10,11}\z/}
end

