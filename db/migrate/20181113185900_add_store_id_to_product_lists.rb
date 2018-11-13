class AddStoreIdToProductLists < ActiveRecord::Migration[5.2]
	def change
		add_column :product_lists, :store_id, :integer
	end
end
