Rails.application.routes.draw do
  root "things#index"
  resources :things, except: [:show]
  resources :categories, only: [:new, :create]
end
