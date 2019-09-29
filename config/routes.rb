Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks", sessions: "users/sessions"}
  root to: "tours#index"
  resources :tours, only: %i(index show) do
    resources :ratings, only: :create
    resources :reviews
    resources :bookings, only: %i(new create)
  end
  resources :reviews do
    resources :likes
    resources :comments do
      member do
        get :reply
      end
    end
  end
  resources :comments do
    resources :comments
  end
  resources :bank_accounts
  
  namespace :admin do
    get "/dashboard", to: "base#index"
    resources :tours
    resources :users
  end
end
