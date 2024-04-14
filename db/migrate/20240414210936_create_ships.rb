class CreateShips < ActiveRecord::Migration[7.0]
  def change
    create_table :ships do |t|
      t.references :record, null: false, foreign_key: true
      t.string :postcode
      t.integer :area_id
      t.string :city
      t.string :street
      t.string :building
      t.string :phone

      t.timestamps
    end
  end
end
