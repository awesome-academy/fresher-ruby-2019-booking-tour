Rails.application.routes.draw do
  root to: "tours#index"
  resources :tours, only: %i(index show) do
    resources :ratings, only: :create
    resources :reviews
  end
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks", sessions: "users/sessions"}
  
  namespace :admin do
    get "/dashboard", to: "base#index"
    resources :tours
  end
end
