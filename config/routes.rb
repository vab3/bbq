Rails.application.routes.draw do
  resources :locs
  devise_for :users
  resources :vendors
  root to: "vendors#index"
end
