class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # 仮想属性の追加
  attr_accessor :commission, :profit

  has_one_attached :image

  # バリデーション
  validates :description, :category_id, :condition_id, :postage_id, :area_id, :delivery_date_id, :price, :user_id, presence: true
  validates :category_id, :condition_id, :postage_id, :area_id, :delivery_date_id,
            exclusion: { in: [1], message: "can't be '---'" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  # 画像の添付を許可
  validates :image, presence: true

  # ActiveHashモデルとの関連付け
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_date

  # 販売手数料と販売利益の計算
  before_save :calculate_commission_and_profit

  # トリムメソッド
  def trim_values
    description&.strip!
    detail&.strip!
  end

  private

  # 画像の存在チェック
  def image_presence
    images.attached?
  end

  # 販売手数料と販売利益の計算と画像の存在チェック
  before_save :calculate_commission_and_profit, :image_presence

  # 販売手数料と販売利益の計算
  def calculate_commission_and_profit
    # 販売手数料の計算
    self.commission = (price * 0.1).floor

    # 販売利益の計算
    self.profit = price - commission
  end

  # ActiveHashモデルのカラムに対するバリデーション
  # validates :category_id, :condition_id, :postage_id, :area_id, :delivery_date_id, presence: true, exclusion: { in: [1], message: "can't be '---'" }, if: -> { category_id.present? && condition_id.present? && postage_id.present? && area_id.present? && delivery_date_id.present? }
end
