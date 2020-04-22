Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items do
    resources :bookings, only: [:new, :create, :update, :edit, :index, :show]
  end
  resources :bookings, only: [:destroy]
end
