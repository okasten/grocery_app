Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
  	resources :favorite_stores do
      resources :stores 
    end
  end

  resources :stores
  resources :products
  resources :product_lists
  resources :lists
  resources :store_products
end
