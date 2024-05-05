class Record < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :ship

  # バリデーション
  validates :user_id, presence: true
  validates :item_id, presence: true

end

