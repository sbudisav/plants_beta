Rails.application.routes.draw do
  namespace :api do
    get "/plants" => 'plants#index'
    post "/plants" => 'plants#create'
    get "/plants/:id" => 'plants#show'
    patch "/plants/:id" => 'plants#update'
    delete "/plants/:id" => 'plants#destroy'

    post "/images" => 'images#create'
  end
end
 