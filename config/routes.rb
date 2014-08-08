Rails.application.routes.draw do
  use_doorkeeper
  resources :users, only: [:new, :create]

  root 'places#index'

  resources :places
  resources :sessions, except: [:index, :show, :edit, :update]

  namespace :api do
    namespace :v1 do
      resources :places
    end
  end
end
