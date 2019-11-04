# create users
User.create!(email: "admin@hotelhero.tech", password: "password", first_name: "Admin", last_name: "User")
Hotelier.create!(email: "hotelier@hotelhero.tech", password: "password", first_name: "Hotelier", last_name: "User")
Vendor.create!(email: "vendor@hotelhero.tech", password: "password", first_name: "Vendor", last_name: "User")
