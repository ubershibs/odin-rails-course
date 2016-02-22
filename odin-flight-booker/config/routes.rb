Rails.application.routes.draw do
  root 'flights#index'
  get 'flights/index'
  resources :bookings, only: [:new, :show, :create]
end
