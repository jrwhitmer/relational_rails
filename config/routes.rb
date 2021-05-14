Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/farmers_market_stands', to: 'farmers_market_stands#index'
  get '/farmers_market_stands/:id', to: 'farmers_market_stands#show'
  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/:id', to: 'dealerships#show'
  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'
  get '/dealerships/:id/cars', to: 'dealerships#show_cars_by_dealership_id'
end
