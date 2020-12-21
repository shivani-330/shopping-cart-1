Rails.application.routes.draw do
  resources :products
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :orders do
    resources :line_items
  end
  resource :carts, only: [:show]
  get '/search' => 'products#search', :as => 'search_page'
  get '/payment_option' => 'orders#payment_option', :as => 'payment'
  post 'orders/place_order'
end
