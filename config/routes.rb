Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :products
  resources :stores
  resources :product_lists
  resources :favorite_stores
  resources :lists
  resources :store_products
end
