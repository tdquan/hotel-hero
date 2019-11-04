categories = ["Human Resource", "Booking Management", "Marketing", "Accounting", "Operations", "Guest Services", "F&B", "IT", "MICE"]
schemes = ["One-time", "Monthly", "Annually"]

# create users
User.create!(email: "admin@hotelhero.tech", password: "password", first_name: "Admin", last_name: "User")
first_hotelier = Hotelier.create!(email: "hotelier@hotelhero.tech", password: "password", name: "Hotelier User")
first_vendor = Vendor.create!(email: "vendor@hotelhero.tech", password: "password", name: "Vendor User")

20.times do
	cname = Faker::Company.name
	name_arr = cname.gsub(",", "").downcase.split(" ")
	vendor = Vendor.create!(email: "vendor-#{name_arr.first}@hotelhero.tech", password: "password", name: cname)
	5.times do
		vendor.softwares.create!(name: Faker::App.name, version: Faker::App.semantic_version, logo_url: Faker::Company.logo, category: categories.sample)
	end
end

10.times do
	cname = Faker::Company.name
	name_arr = cname.gsub(",", "").downcase.split(" ")
	hotelier = Hotelier.create!(email: "vendor-#{name_arr.first}@hotelhero.tech", password: "password", name: cname)
	categories.each do |category|
		suite = hotelier.software_suites.create!(category: category)
		softwares = Software.where(category: category)
		rand(1..5).times do
			suite.subscriptions.create!(payment_scheme: schemes.sample, software: softwares.sample)
		end
	end
end

5.times do
	first_vendor.softwares.create!(name: Faker::App.name, version: Faker::App.semantic_version, logo_url: Faker::Company.logo, category: categories.sample)
end

categories.each do |category|
	suite = first_hotelier.software_suites.create!(category: category)
	softwares = Software.where(category: category)
	rand(1..5).times do
		suite.subscriptions.create!(payment_scheme: schemes.sample, software: softwares.sample)
	end
end

