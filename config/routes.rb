Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resources :posts, only: %i[new create edit updaet destroy show]
  resources :users, only: :show 
  resources :shops
  resources :toppages, only: :index
  root to: 'toppages#index'
  resources :nices, only: %i[create destroy]
  resources :likes, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
  resource :profile,only: %i[edit update]

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  devise_scope :user do
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end



  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
