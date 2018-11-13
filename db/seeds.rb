require 'csv'

[1, 2, 3].each do |num|
	User.create(
		username: "user#{num}",
		email: "user#{num}@example.com",
		password: "test123",
		name: "name#{num}"
		)
end

[1, 2, 3].each do |num|
	Store.create(
		address: "address#{num}",
		name: "name#{num}"
		)
end

csv_text = File.read('db/products.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
	Product.create!(row.to_hash)
end

[1, 2, 3].each do |num|
	List.create(
		user_id: num,
		name: "name#{num}"
		)
end

[1, 2, 3].each do |num|
	ProductList.create(
		list_id: num,
		store_id: num,
		product_id: num,
		product_amount: num
		)
end

[1, 2, 3].each do |num|
	FavoriteStore.create(
		user_id: num,
		store_id: num,
		comment: "comment#{num}"
		)
end

[1, 2, 3].each do |num|
	StoreProduct.create(
		aisle: "aisle#{num}",
		price: num,
		store_id: num,
		product_id: num
		)
end
