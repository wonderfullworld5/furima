class CreateShips < ActiveRecord::Migration[7.0]
  def change
    create_table :ships do |t|
      t.references :record, null: false, foreign_key: true
      t.string :postcode, null: false
      t.integer :area_id, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :building
      t.string :phone, null: false

      t.timestamps
    end
  end
end
