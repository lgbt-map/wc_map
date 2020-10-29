Rails.application.routes.draw do
  root to: 'coordinates#index'
  resources :coordinates, only: [:show, :new, :create]
  post '', to: 'coordinates#search', as: 'search'
end
