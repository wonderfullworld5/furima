Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions'
  }, path_names: { sign_in: 'sign_in', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'signup' }

  # ユーザーの詳細ページへのルートを追加
  resources :users, only: [:show]
 
  # CSSファイルへのルートを追加
 get 'styles.css', to: redirect('assets/styles.css')
  root 'items#index'
end

