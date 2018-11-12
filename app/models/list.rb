class List < ApplicationRecord
	belongs_to :user
	has_many :product_list
	has_many :products, through: :product_list
end
