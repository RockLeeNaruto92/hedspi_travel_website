Rails.application.routes.draw do
  root "travels#index"

  resources :travels, only: :index
  resources :places, only: [:index, :show]
  resources :tours, only: :show
  resources :hotels, only: [:index, :show]
  resources :bookings, only: [:index, :create]
end
