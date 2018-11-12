class CreateFavoriteStores < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_stores do |t|
      t.integer :user_id
      t.integer :store_id
      t.string :comment

      t.timestamps
    end
  end
end
