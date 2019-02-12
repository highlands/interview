Rails.application.routes.draw do
  

  
  resources :products
  root to: 'dashboard#index'
  get :search, controller: :main
end
