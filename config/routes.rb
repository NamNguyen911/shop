Rails.application.routes.draw do
  resources :order_items, only: [:create, :update, :destroy]

  get 'carts/show'
  get 'carts/checkout'
  post 'carts/confirm'

  get 'thank_you', to: 'home#thank_you'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#index'

  resources :products

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
