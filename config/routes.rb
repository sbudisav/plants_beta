Rails.application.routes.draw do
  namespace :api do
    get "/plants" => 'plants#index'
    post "/plants" => 'plants#create'
    get "/plants/:id" => 'plants#show'
    patch "/plants/:id" => 'plants#update'
    delete "/plants/:id" => 'plants#destroy'

    get "/user_plants" => 'user_plants#index'
    post "/user_plants" => 'user_plants#create'
    get "/user_plants/:id" => 'user_plants#show'
    patch "/user_plants/:id" => 'user_plants#update'
    delete "/user_plants/:id" => 'user_plants#destroy'

    get "/images" => 'images#index'
    post "/images" => 'images#create'
    patch "/images/:id" => 'images#update'

    post "/users" => "users#create"

    post "/sessions" => "sessions#create"
  end
end
 