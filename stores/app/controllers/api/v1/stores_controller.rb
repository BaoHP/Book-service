class Api::V1::StoresController < ActionController::API
    def index
      stores = Store.all

      # my_stores = []
      # stores.map do |store|

      #   url = 'http://books:3000/api/v1/books/' + store.id.to_s

      #   book_info = []

      #   begin
      #     book_info = HTTParty.get(url, read_timeout: 10)
      #   rescue Net::ReadTimeout => e
      #     @error_message = "Comments couldn't be retrieved, please try again later."
      #     Rollbar.error(e);
      #   end

      #   my_stores.push({ id: store.id, name: store.name, books: book_info})
      # end
      
      render json: { results: stores }.to_json, status: :ok
    end
    def show
      store = Store.where(id: params[:id])
      url = 'http://books:3000/api/v1/books/' + params[:id].to_s
      begin
        response = HTTParty.get(url, read_timeout: 10)
      rescue Net::ReadTimeout => e
        response = []
        @error_message = "Comments couldn't be retrieved, please try again later."
        Rollbar.error(e);
      end

      render json: { store: store.to_json, book_infos: response }.to_json, status: :ok
    end
  end