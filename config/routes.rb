Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/farmers_market_stands', to: 'farmers_market_stands#index'
  get '/farmers_market_stands/:id', to: 'farmers_market_stands#show'
  get '/produce_items', to: 'produce_items#index'
  get '/produce_items/:id', to: 'produce_items#show'
  get '/farmers_market_stands/:id/produce_items', to: 'farmers_market_stands#show_produce_items_by_farmers_market_stand_id'
  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/:id', to: 'dealerships#show'
  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'
  get '/dealerships/:id/cars', to: 'dealerships#show_cars_by_dealership_id'
end
