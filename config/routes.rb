Rails.application.routes.draw do
  root "travels#index"

  resources :travels, only: :index
  resources :places, only: [:index, :show]
  resources :tours, only: :index
  resources :hotels, only: :index
  resources :bookings, only: [:index, :create]
end
