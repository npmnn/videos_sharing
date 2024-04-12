require 'sidekiq/web'
Rails.application.routes.draw do
  root 'homes#index'
  get 'homes/index'

  devise_for :users

  resources :videos, only: [:create]

  mount ActionCable .server => '/cable'

  mount Sidekiq::Web => '/sidekiq'
end
