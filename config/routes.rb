Rails.application.routes.draw do
  root 'items#index'
  devise_for :users

  resources :articles

  resources :items do
    resources :records, only: [:index, :create]  # index は自動的に :item_id を含む
    resources :orders, only: [:index, :create]
  end
end
