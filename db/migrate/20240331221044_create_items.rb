class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :description, null: false
      t.text :detail, null: false
      t.string :category_id, null: false
      t.string :postage_id, null: false
      t.string :area_id, null: false
      t.string :delivery_date_id, null: false
      t.string :price, null: false
      t.string :user, null: false, foreign_key: true
      t.string :condition_id, null: false
      t.timestamps
    end
  end
end
