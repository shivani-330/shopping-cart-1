Rails.application.routes.draw do
  resources :products
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :orders do
    resources :line_items, except: [:index]
  end
  resources :line_items, only: [:index]
end
