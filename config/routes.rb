Rails.application.routes.draw do
  get 'dashboard/index'
  get 'flights/index'
  get 'flights/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',

  }

  root 'home#index'

  resources :hotels do
    resources :rooms
    resources :facilities
    resources :hotel_services
    resources :hotel_rules
    resources :reviews
  end
  resources :cars, only: [:index, :show] do
    member do
      patch 'book'
    end
  end
  resources :tours, only: [:index, :show]  
  resources :flights, only: [:index, :show]
  get '/flights/search', to: 'flights#search'
  get 'dashboard', to: 'dashboard#index'
  resources :events, only: [:index, :show]
  resources :boats, only: [:index, :show]
    resources :boats do
    member do
      get 'rent'
      patch 'confirm_rental'
    end
  end
  resources :food_items
  resources :orders, only: [:new, :create, :show]
  resources :orders, only: [:index, :show, :update]
end
