class CreateStoreProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :store_products do |t|
      t.string :aisle
      t.real :price
      t.integer :store_id
      t.integer :product_id

      t.timestamps
    end
  end
end
