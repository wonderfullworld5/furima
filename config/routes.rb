Rails.application.routes.draw do
  resources :articles
  devise_for :users
  resources :items, only: [:index, :new, :create]
  root 'items#index'
end
