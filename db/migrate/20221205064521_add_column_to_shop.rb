class AddColumnToShop < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :place_id, :string, null: false
  end
end
