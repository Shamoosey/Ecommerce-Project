Rails.application.routes.draw do

  resources :product, only: :show
  root to: 'product#index'

  post 'products/add_to_cart/:id', to: 'product#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to: 'product#remove_from_cart', as: 'remove_from_cart'

  get 'product/id', to: 'product#show', id: /\d+/
  get 'contact', to: 'contact#index', as: 'contact'
  get 'about', to: 'about#index', as: 'about'
  get 'search', to: 'product#search', as: :search

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
