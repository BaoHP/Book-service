Rails.application.routes.draw do
  resources :stores
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :stores
    end
  end
end