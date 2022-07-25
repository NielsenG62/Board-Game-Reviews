Rails.application.routes.draw do
  get '/reviews' => 'reviews#index'
  post '/reviews' => 'reviews#search'
  get '/results' => 'reviews#results'
  root to: "reviews#index"
end
