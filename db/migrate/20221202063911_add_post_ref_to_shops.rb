class AddPostRefToShops < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :shop, null: false, foreign_key: true
    add_reference :posts, :user, null: false, foreign_key: true
  end
end
