Rails.application.routes.draw do
  
  resources :beers

  # Defines the root path route ("/")
  root "beers#index"
end
