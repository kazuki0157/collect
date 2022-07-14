Rails.application.routes.draw do
  get 'trades/index'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :trade, only: [:index, :new, :create]
  end
end
