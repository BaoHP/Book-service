class Api::V1::StoresController < ActionController::API
    def index
      stores = Store.all
      stores = stores.map do |store|
        { id: store.id, name: store.name }
      end
      
      render json: { results: stores }.to_json, status: :ok
    end
  end