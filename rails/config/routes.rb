Rails.application.routes.draw do
  devise_for :users
  resources :vendors
  resources :locations
  get '/restaurants', to: 'locations#restaurants'
  get '/states', to: 'locations#states'
  get '/locations/by_state/:state', to: 'locations#by_state', as: 'locations_by_state'
  root to: "vendors#index"
end
