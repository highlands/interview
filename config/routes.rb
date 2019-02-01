Rails.application.routes.draw do
  resources :product_properties
  resources :properties
  resources :products
  root to: 'dashboard#index'
  get :search, controller: :main
end
