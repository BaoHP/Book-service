Rails.application.routes.draw do
  # resources :stores
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :reviews
    end
  end
end