Rails.application.routes.draw do

  resources :product, only: :show

  root to: 'product#index'

  get 'product/id', to: 'product#show', id: /\d+/
  get 'contact', to: 'contact#index', as: 'contact'
  get 'about', to: 'about#index', as: 'about'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
