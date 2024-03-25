Rails.application.routes.draw do
  resources :articles
  devise_for :users
  resources :items, only: [:index, :new, :create]
  root 'items#index'
  get '/items/user', to: 'items#new', as: 'new_user_item'
end

