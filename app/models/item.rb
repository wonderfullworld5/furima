class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # commission と profit の仮想属性を追加
  attr_accessor :commission, :profit

  # 価格に応じた販売手数料と販売利益の計算を行う
  before_save :calculate_commission_and_profit

  # ActiveHashモデルとの関連付け
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_date

  # バリデーション
  validates :description, :detail, :category, :condition, :postage, :area, :delivery_date, :delivery_date_id, :price, presence: true
  validates :category, :condition, :postage, :area, :delivery_date, exclusion: { in: [1], message: "can't be '---'" }
  validates :price, only_integer: true

  # 画像の添付を許可し、必須とするバリデーション
  has_one_attached :image
  validates :image, presence: true

  # 価格に応じた販売手数料と販売利益の計算を行うメソッド
  def calculate_commission_and_profit
    # 販売手数料の計算
    self.commission = (price * 0.1).floor

    # 販売利益の計算
    self.profit = price - commission
  end
end
