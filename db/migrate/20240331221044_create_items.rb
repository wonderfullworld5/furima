class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.text :description, null: false
      t.text :detail, null: false
      t.integer :category_id, null: false
      t.integer :postage_id, null: false
      t.integer :area_id, null: false
      t.integer :delivery_date_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :condition_id, null: false
      t.timestamps
    end
  end
end
