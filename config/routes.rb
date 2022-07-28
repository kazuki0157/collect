Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    get 'trade', to: 'items#trade_new'
  end
  
  resources :users, only: :show

end