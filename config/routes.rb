Rails.application.routes.draw do
  root 'items#index'
  devise_for :users

  resources :articles

  resources :items do
    resources :records, only: [:index, :create] do
      get 'new_order', on: :member
      post 'create_order', on: :member
  end
end
end