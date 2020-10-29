Rails.application.routes.draw do
  root to: 'coordinates#index'
  resources :maps, only: [:show]
  resources :coordinates, only: [:show, :new, :create]
  post 'search', to: 'coordinates#search'
end
