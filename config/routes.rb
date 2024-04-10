Rails.application.routes.draw do
  resources :articles
  resources :items, only: [:index]
  devise_for :users
  resources :items
  root 'items#index'
  get '/items/new_user', to: 'items#new', as: 'new_user_item'
end


