class Api::V1::BooksController < ActionController::API
  def index
    books = Book.all
    books = books.map do |book|
      { id: book.id, store_id: book.store_id, name: book.name }
    end
    response = HTTParty.get('http://localhost:3000/api/v1/stores')
    puts "XXXXXXXXXXXX"
    puts params[:id]
    puts eval(response.body)[:results].first[:id]
    puts "XXXXXXXXXXXX"

    render json: { results: books }.to_json, status: :ok
  end

  def show
    books = Book.all
    books = books.map do |book|
      { id: book.id, store_id: book.store_id, name: book.name }
    end
    response = HTTParty.get('http://localhost:3000/api/v1/stores')
    puts "XXXXXXXXXXXX"
    puts params[:id]
    puts eval(response.body)[:results].first[:id]
    puts "XXXXXXXXXXXX"

    render json: { results: books }.to_json, status: :ok
  end
end