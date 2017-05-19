Rails.application.routes.draw do
  get 'categories/show'

  resources :order_items, only: [:create, :update, :destroy]

  get 'carts/show'
  get 'carts/checkout'
  post 'carts/confirm'

  get 'thank_you', to: 'home#thank_you'

  resources :orders, only: [:index] do
    get 'fulfill', on: :member
  end

  resources :categories, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#index'

  resources :products

  devise_for :users
  # devise_scope :user do
  #   get 'sign_in', to: 'devise/sessions#new'
  # end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
