Rails.application.routes.draw do
  resources :users

  root 'places#index'

  resources :places
  resources :sessions
end
