Rails.application.routes.draw do
  root 'places#index'

  resources :places

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
