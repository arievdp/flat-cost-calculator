require 'sidekiq/web'

  Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :groups
  resources :transactions
  resources :flats
  resources :invitations


  # devise_for :users
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: 'home#index'
  get '/:invitation/:token', to: 'invitations#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
