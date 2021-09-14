# frozen_string_literal: true

Rails.application.routes.draw do
  get '/home' , to: 'user_pages#home' # userのhome画面
  get '/agree', to: 'user_pages#agree' # 鍵などの合意画面
  get '/cancel', to: 'user_pages#cancel' # サービスからの退会画面
  
  namespace :admin do
    root to: 'admin_pages#home'
    get 'question', to: 'admin_pages#question'
  end

  resources :mediation_contracts, only: [:new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  mount KomachiHeartbeat::Engine => '/ops'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users, only: %i[show]
  get 'delegation_contract', to: 'users#delegation_contract'
  post 'delegation_contract', to: 'users#delegation_contract'

  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    passwords: 'admin_users/passwords',
    registrations: 'admin_users/registrations'
  }
end
