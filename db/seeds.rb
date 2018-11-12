[1, 2, 3].each do |num|
	User.create(
		username: "user#{num}"
		email: "user#{num}@example.com"
		password: "test123"
		name: "name#{num}"
		)
end

[1, 2, 3].each do |num|
	Store.create(
		address: "address#{num}"
		name: "name#{num}"
		)
end