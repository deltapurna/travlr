Rails.application.routes.draw do
  root 'places#index'

  resources :places

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  delete '/logout', to: 'sessions#destroy'
end
