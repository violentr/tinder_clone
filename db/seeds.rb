require 'net/http'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


uri = URI('https://randomuser.me/api/?results=50')
response = Net::HTTP.get(uri)
output = JSON.parse(response)["results"]
puts "Populating database with users .."
output.each do |item|
  user = User.create(email: item["email"], password: "password",
                     password_confirmation: "password",
                     confirmed_at: Date.today - 1.day)
  user.uploads.create(image: item["picture"]["large"]) if user.persisted?
end
