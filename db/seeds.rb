require 'csv'

User.create(
	username: "kevywevy",
	email: "kevywevy@example.com",
	password: "test123",
	name: "Kevin"
)
User.create(
	username: "davethewave",
	email: "davethewave@example.com",
	password: "test123",
	name: "David"
)
User.create(
	username: "oliviabolivia",
	email: "oliviabolivia@example.com",
	password: "test123",
	name: "Olivia"
)

Store.create(
	address: "142 E 14th St., New York, NY 10003",
	name: "Trader Joe's"
)
Store.create(
	address: "4 Union Square W S, New York, NY 10003",
	name: "Whole Foods"
)
Store.create(
	address: "10 Union Square E, New York, NY 10003",
	name: "The Food Emporium"
)
Store.create(
	address: "214 3rd Ave, New York, NY 10003",
	name: "Asia Market"
)

csv_text = File.read('db/products.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
	Product.create!(row.to_hash)
end

List.create(
	user_id: 1,
	name: "2018/10/02 - Sunday"
)
List.create(
	user_id: 2,
	name: "2018/11/10 - Grocery"
)
List.create(
	user_id: 3,
	name: "2018/11/14 - Toilet Paper"
)

# [1, 2, 3].each do |num|
# 	ProductList.create(
# 		list_id: num,
# 		store_id: num,
# 		product_id: num,
# 		product_amount: num
# 		)
# end

# [1, 2, 3].each do |num|
# 	FavoriteStore.create(
# 		user_id: num,
# 		store_id: num,
# 		comment: "Comment #{num}"
# 		)
# end

# [1, 2, 3].each do |num|
# 	StoreProduct.create(
# 		aisle: "Aisle #{num}",
# 		price: num,
# 		store_id: num,
# 		product_id: num
# 		)
# end
