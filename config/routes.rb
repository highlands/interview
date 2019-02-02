Rails.application.routes.draw do
  
  resources :properties
  resources :product_properties
  resources :products

  
  root to: 'dashboard#index'
  get :search, controller: :main
end
