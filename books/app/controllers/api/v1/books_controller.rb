class Api::V1::BooksController < ActionController::API
  def index
    books = Book.all
    # books = books.map do |book|
    #   { id: book.id, store_id: book.store_id, name: book.name }
    # end
    # begin
    #   response = HTTParty.get('http://stores:3000/api/v1/stores', read_timeout: 10)
    # rescue Net::ReadTimeout => e
    #   response = []
    #   @error_message = "Comments couldn't be retrieved, please try again later."
    #   Rollbar.error(e);
    # end

    render json: { results: books }.to_json, status: :ok
  end

  def show
    books = Book.where(store_id: params[:id])
    my_books = []
    books.map do |book|

      url = 'http://reviews:3000/api/v1/reviews/' + book.id.to_s

      review_info = []
      
      begin
        review_info = HTTParty.get(url, read_timeout: 10)
      rescue Net::ReadTimeout => e
        @error_message = "Comments couldn't be retrieved, please try again later."
        Rollbar.error(e);
      end

      my_books.push({ id: book.id, name: book.name, store_id: book.store_id, reviews: review_info})
    end

    render json: { results: my_books }.to_json, status: :ok
  end
end