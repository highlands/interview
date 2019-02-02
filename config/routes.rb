Rails.application.routes.draw do
  
  resources :properties
  
  resources :products do
    resources :product_properties, except: [:index], controller: 'products/product_properties'
  end

  
  root to: 'dashboard#index'
  get :search, controller: :main
end
