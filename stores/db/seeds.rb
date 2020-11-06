# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Store.create(name: 'Nala')
Store.create(name: 'Alex')
Store.create(name: 'Leroy')
Store.create(name: 'Belle')

store = Store.first

Book.create(name: 'Nala', store_id: store.id)
Book.create(name: 'Nala', store_id: store.id)
Book.create(name: 'Nala', store_id: store.id)
Book.create(name: 'Nala', store_id: store.id)

book = Book.first 

Book.create(content: 'Nala', book_id: book.id)
Book.create(content: 'Nala', book_id: book.id)
Book.create(content: 'Nala', book_id: book.id)
Book.create(content: 'Nala', book_id: book.id)
