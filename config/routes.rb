Rails.application.routes.draw do
  root 'items#index'
  devise_for :users

  resources :articles

  resources :items do
    resources :records, only: [:index, :create] do
      member do
        get 'new_order'  # new_order をメンバールートとして設定
        post 'create_order'
      end
      collection do
        get 'success', as: 'success_item_records'
      end
    end
  end
end
