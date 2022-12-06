Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :posts
  resources :users, only: :show
  resources :shops
  resources :toppages, only: :index
  root to: 'toppages#index'
  resources :nices, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
