class Api::V1::BooksController < ActionController::API
  def index
    books = Book.all
    books = books.map do |book|
      { id: book.id, name: book.name }
    end
    
    render json: { results: books }.to_json, status: :ok
  end
end