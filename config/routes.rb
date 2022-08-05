Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    #get 'trade', to: 'items#trade_new'
    #get 'select', to: 'items#item_select'
    resources :relationships, only: [:index, :create, :destroy]
    #  get 'select', to: 'relationships#item_select'
  end

  resources :users, only: :show

end