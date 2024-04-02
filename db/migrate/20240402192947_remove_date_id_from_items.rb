class RemoveDateIdFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :date_id
  end
end
