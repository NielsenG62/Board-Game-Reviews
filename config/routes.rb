Rails.application.routes.draw do
  get '/reviews' => 'reviews#index'
  get '/results' => 'reviews#results'
  root to: "reviews#index"
end
