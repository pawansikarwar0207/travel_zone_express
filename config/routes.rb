Rails.application.routes.draw do
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
end
