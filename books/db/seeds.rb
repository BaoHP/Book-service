# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
book_names = ["Romantic Spots for Honeymoons", 
    "Top Island Getaways", 
    "Most Romantic Destinations", 
    "Top Spots for Skiing"]
    book_names.each do |book_name|
Book.create(name: book_name, store_id: '5fa10a9f7820ee6c473d01ee')
end