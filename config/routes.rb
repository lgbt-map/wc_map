Rails.application.routes.draw do
  root to: 'coordinates#index'
  post '', to: 'coordinates#search', as: 'search'
  get 'coordinates', to: 'coordinates#new'
  resources :coordinates, only: [:show, :new, :create]
end
