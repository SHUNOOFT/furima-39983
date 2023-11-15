Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items 
  resources :purchase_orders 

end
