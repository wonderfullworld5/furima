class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.text :description
      t.text :detail
      t.integer :category_id
      t.integer :condition_id
      t.integer :postage_id
      t.integer :area_id
      t.integer :date_id
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

