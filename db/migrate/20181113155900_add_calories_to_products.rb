class AddCaloriesToProducts < ActiveRecord::Migration[5.2]
	def change
		add_column :products, :calories, :integer
	end
end
