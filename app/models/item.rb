class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image
  belongs_to :user
  # ActiveHashモデルとの関連付け
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_date

  # バリデーション
  validates :description, :category_id, :condition_id, :postage_id, :area_id, :delivery_date_id, :price,  presence: true
  # ActiveHashモデルのカラムに対するバリデーション
  validates :category_id, :condition_id, :postage_id, :area_id, :delivery_date_id, numericality: { other_than: 1  , message: "can't be blank"}
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  # 画像の添付を許可
  validates :image, presence: true
end
