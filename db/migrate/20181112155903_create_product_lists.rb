class CreateProductLists < ActiveRecord::Migration[5.2]
  def change
    create_table :product_lists do |t|
      t.integer :list_id
      t.integer :product_id
      t.integer :product_amount

      t.timestamps
    end
  end
end
