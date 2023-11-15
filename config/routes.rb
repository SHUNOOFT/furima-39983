Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items 
  root to: 'purchase_orders#index'
  resources :purchase_orders 

end
