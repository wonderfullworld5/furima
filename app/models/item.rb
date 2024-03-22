class Item < ApplicationRecord
  has_one_attached :image

    validates :itemesname, presence: true
    validates :description, presence: true
    validates :category, presence: true, inclusion: { in: ["---", "メンズ", "レディース", "ベビー・キッズ", "インテリア・住まい・小物", "本・音楽・ゲーム", "おもちゃ・ホビー・グッズ", "家電・スマホ・カメラ", "スポーツ・レジャー", "ハンドメイド", "その他"] }
    validates :condition, presence: true, inclusion: { in: ["---", "新品・未使用", "未使用に近い", "目立った傷や汚れなし", "やや傷や汚れあり", "傷や汚れあり", "全体的に状態が悪い"] }
    validates :postage, presence: true, inclusion: { in: ["---", "着払い(購入者負担)", "送料込み(出品者負担)"] }
    validates :area, presence: true, inclusion: { in: ["---", "北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県", "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県", "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県", "静岡県", "愛知県", "三重県", "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県", "鳥取県", "島根県", "岡山県", "広島県", "山口県", "徳島県", "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"] }
    validates :days, presence: true, inclusion: { in: ["---", "1~2日で発送", "2~3日で発送", "4~7日で発送"] }
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
end


