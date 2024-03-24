Rails.application.routes.draw do
  resources :articles  # articlesリソースに対するすべての標準的なルートが自動的に生成
  devise_for :users
  root 'items#index'
end

