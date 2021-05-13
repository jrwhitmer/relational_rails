Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/farmers_market_stands', to: 'farmers_market_stands#index'
  get '/farmers_market_stands/:id', to: 'farmers_market_stands#show'
end
