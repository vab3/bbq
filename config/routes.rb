Rails.application.routes.draw do
  devise_for :users
  resources :vendors
  resources :locations
  get '/restaurants', to: 'locations#restaurants'
  root to: "vendors#index"
end
