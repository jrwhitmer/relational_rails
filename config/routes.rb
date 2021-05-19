Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/farmers_market_stands', to: 'farmers_market_stands#index'
  # get '/farmers_market_stands/new', to: 'farmers_market_stands#new'
  # post '/farmers_market_stands/new', to: 'farmers_market_stands#new'
  # post '/farmers_market_stands', to: 'farmers_market_stands#create'
  # get '/farmers_market_stands/:id', to: 'farmers_market_stands#show'
  # get '/farmers_market_stands/:farmers_market_stand_id/produce_items', to: 'farmers_market_stand_produce_items#index'
  # get '/produce_items', to: 'produce_items#index'
  # get '/produce_items/:id', to: 'produce_items#show'

  get '/produce_items', to: 'produce_items#index'
  get '/produce_items/:id', to: 'produce_items#show'
  get '/farmers_market_stands/:farmers_market_stand_id/produce_items', to: 'farmers_market_stand_produce_items#index'
  get '/farmers_market_stands', to: 'farmers_market_stands#index'
  get '/farmers_market_stands/new', to: 'farmers_market_stands#new'
  post '/farmers_market_stands/new', to: 'farmers_market_stands#new'
  post '/farmers_market_stands', to: 'farmers_market_stands#create'
  get '/farmers_market_stands/:id', to: 'farmers_market_stands#show'

  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/:id', to: 'dealerships#show'
  get '/dealerships/:dealership_id/cars', to: 'dealership_cars#index'
  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'
end
