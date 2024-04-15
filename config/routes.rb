Rails.application.routes.draw do
  root 'items#index'
  devise_for :users

  resources :articles

  resources :items do

  resources :records, only: [:new, :create]

  resources :orders, only: [:new, :create]  # newは購入フォーム、createは購入処理
    #resources :purchases, only: [:new, :create, :edit,:update,:destroy]
  end
  #get '/items/new_user', to: 'items#new', as: 'new_user_item'
end

