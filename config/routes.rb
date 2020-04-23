# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end

  resources :product, only: :show
  root to: 'product#index'

  post 'products/add_to_cart/:id', to: 'product#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to: 'product#remove_from_cart', as: 'remove_from_cart'
  post 'products/decrement/:id', to: 'product#decrement', as: 'decrement_qty'
  post 'products/increment/:id', to: 'product#increment', as: 'increment_qty'

  get 'province', to: 'checkout#province', as: 'confirm_province'
  get 'product/id', to: 'product#show', id: /\d+/
  get 'contact', to: 'contact#index', as: 'contact'
  get 'about', to: 'about#index', as: 'about'
  get 'search', to: 'product#search', as: :search

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
