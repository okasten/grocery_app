class StoreProduct < ApplicationRecord
	belongs_to :store
	belongs_to :product

	validates :store_id, uniqueness: {scope: :product_id}
	validates :price, { presence: true }
	validates :aisle, { presence: true }
end
