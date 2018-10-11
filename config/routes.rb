Rails.application.routes.draw do
  namespace :api do
    get "/plants" => 'plants#index'
    post "/plants" => 'plants#create'
    get "/plants/:id" => 'plants#show'
    patch "/plants/:id" => 'plants#update'
    delete "/plants/:id" => 'plants#destroy'

    get "/images" => 'images#index'
    post "/images" => 'images#create'

    post "/users" => "users#create"

    post "/sessions" => "sessions#create"
  end
end
 