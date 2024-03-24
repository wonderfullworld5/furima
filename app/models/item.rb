class Item < ApplicationRecord
  # 商品画像を1枚つけることが必須
  has_one_attached :image
  validates :image, presence: true
  belongs_to :category

  # 商品名が必須
  validates :name, presence: true

  # 商品の説明が必須
  validates :description, presence: true

  # カテゴリーの情報が必須
  validates :category, presence: true

  # 商品の状態の情報が必須
  validates :condition, presence: true

  # 配送料の負担の情報が必須
  validates :shipping_fee_burden, presence: true

  # 発送元の地域の情報が必須
  validates :shipping_area, presence: true

  # 発送までの日数の情報が必須
  validates :shipping_days, presence: true

  # 価格の情報が必須
  validates :price, presence: true

  # 価格の範囲とフォーマットのバリデーション
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :price, format: { with: /\A[0-9]+\z/, message: "は半角数字で入力してください" }

  # 価格に応じた販売手数料と販売利益の計算
  before_save :calculate_commission_and_profit

  private

  # 販売手数料と販売利益の計算
  def calculate_commission_and_profit
    if price.present?
      # 販売手数料の計算
      self.commission = (price * 0.1).floor

      # 販売利益の計算
      self.profit = price - commission
    end
  end
end
