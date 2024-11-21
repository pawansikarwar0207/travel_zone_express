Rails.application.routes.draw do
  get 'payment/index'
  get 'profiles/show'
  get 'rewards/index'
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

  resources :cars do
    member do
      patch 'book'
    end
  end

  resources :tours  
  
  resources :flights
  
  get '/flights/search', to: 'flights#search'
  get 'dashboard', to: 'dashboard#index'
  
  resources :events
  
  resources :boats do
    member do
      get 'rent'
      patch 'confirm_rental'
    end
  end
  
  resources :food_items
  resources :orders, only: [:new, :create, :show]
  resources :orders, only: [:index, :show, :update]
  resources :rewards, only: [:index]
  get '/profile', to: 'profiles#show', as: 'user_profile'
    # Payments Routes
    resources :payments, only: [:new, :create]
  
    get 'scan_payments', to: 'payments#scan'
    get 'ewallet_payments', to: 'payments#ewallet'
    get 'crypto_payments', to: 'payments#crypto'
    get 'bank_transfer', to: 'payments#bank_transfer' 
    
    get 'cards/new', to: 'cards#new', as: 'new_card'
    namespace :admin do
      resources :users
    end    
end
