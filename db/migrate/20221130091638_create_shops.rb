class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.float :latitude 
      t.float :longitude 
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :shops, :name,                unique: true
  end
end
