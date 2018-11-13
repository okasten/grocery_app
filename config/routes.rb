Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
  	resources :favorite_stores do
      resources :stores
    end
    resources :product_lists

  end
  resources :lists

  resources :stores do
    get 'products_search', to: 'stores#products_search'
  end
  resources :products
  # resources :product_lists

  resources :store_products
end
