# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

contents = ["review1", 
    "review2", 
    "review3", 
    "review4"]
contents.each do |content|
    Review.create(content: content, book_id: '5fa8e7906176df002854d19c')
end
