Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions'
  }, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'signup' }
  
  # ユーザーの詳細ページへのルートを追加
  resources :users, only: [:show]

  root 'items#index'
end

