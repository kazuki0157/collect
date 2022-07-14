Rails.application.routes.draw do
  get 'trades/index'
  devise_for :users
  root to: "items#index"
  resources :items
end
