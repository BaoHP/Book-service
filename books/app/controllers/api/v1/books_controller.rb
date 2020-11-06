class Api::V1::BooksController < ActionController::API
  def index
    books = Book.all
    books = books.map do |book|
      { id: book.id, store_id: book.store_id, name: book.name }
    end
    begin
      response = HTTParty.get('http://stores:3000/api/v1/stores', read_timeout: 10)
    rescue Net::ReadTimeout => e
      response = []
      @error_message = "Comments couldn't be retrieved, please try again later."
      Rollbar.error(e);
    end
    
    puts "XXXXXXXXXXXX"
    # puts params[:id]
    # puts eval(response.body)[:results].first[:id]
    puts "XXXXXXXXXXXX"

    render json: { results: books }.to_json, status: :ok
  end

  def show
    books = Book.where(store_id: params[:id])
    # books = books.map do |book|
    #   { id: book.id, store_id: book.store_id, name: book.name }
    # end
    response = HTTParty.get('http://stores/api/v1/stores')
    puts "XXXXXXXXXXXX"
    puts response
    # puts eval(response.body)[:results].first[:id]
    puts "XXXXXXXXXXXX"

    render json: { results: books }.to_json, status: :ok
  end
end