class Api::V1::StoresController < ActionController::API
    def index
      stores = Store.all

      my_stores = []
      stores.map do |store|

        p "YYYYYYYY"
        p store.id.class
        p "YYYYYYYYY"

        url = 'http://books:3000/api/v1/books/' + store.id.to_s

        p "eeeeeeeeee"
        p url
        p "eeeeeeeeee"

        book_info = []

        begin
          book_info = HTTParty.get(url, read_timeout: 10)
          p "ZZZZZZZZZ"
        rescue Net::ReadTimeout => e
          @error_message = "Comments couldn't be retrieved, please try again later."
          Rollbar.error(e);
        end

        p "XXXXXXXXXXX"
        p book_info
        p "XXXXXXXXXXX"

        my_stores.push({ id: store.id, name: store.name, books: book_info})
      end
      
      render json: { results: my_stores }.to_json, status: :ok
    end
    def show
      stores = Store.all
      url = 'http://books:3000/api/v1/books/' + params[:id].to_s
      begin
        response = HTTParty.get(url, read_timeout: 10)
      rescue Net::ReadTimeout => e
        response = []
        @error_message = "Comments couldn't be retrieved, please try again later."
        Rollbar.error(e);
      end

      render json: { results: response }.to_json, status: :ok
    end
  end