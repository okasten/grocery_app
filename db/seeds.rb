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

['banana', 'apple', 'strawberry'].each do |name|
	Product.create(
		name: name
		)
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
