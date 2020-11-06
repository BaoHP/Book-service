class Api::V1::StoresController < ActionController::API
    def index
      stores = Store.all
      begin
        response = HTTParty.get('http://books:3000/api/v1/books/5fa10a9f7820ee6c473d01ee', read_timeout: 10)
      rescue Net::ReadTimeout => e
        response = []
        @error_message = "Comments couldn't be retrieved, please try again later."
        Rollbar.error(e);
      end
      puts "XXXXXXXXXXXX"
      puts params[:id]
      puts response
      puts "XXXXXXXXXXXX"

      stores = stores.map do |store|
        { id: store.id, name: store.name, chocolate: 'sdsdf' }
      end
      
      render json: { results: stores }.to_json, status: :ok
    end
  end