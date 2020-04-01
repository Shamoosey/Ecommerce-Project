Rails.application.routes.draw do
  resources :product, only: :show

  root to: 'product#index'

  get 'product/id', to: 'product#show', id: /\d+/

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
