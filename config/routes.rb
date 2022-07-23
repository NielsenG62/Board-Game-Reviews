Rails.application.routes.draw do
  get '/index' => 'home#index'
  post '/index' => 'home#search'
  root to: "home#index"

end
