Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items do
    resources :bookings, only: [:new, :create, :update, :edit, :index, :show, :index_as_renter]
  end
  resources :bookings, only: [:destroy]

  namespace :my do
    resources :items, only: [:index]
    resources :bookings, only: [:index, :update]
  end

  get '/bookings' => 'bookings#index_as_renter', :as => 'index_as_renter'
end
