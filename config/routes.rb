Rails.application.routes.draw do
<<<<<<< HEAD
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

=======
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'furima#index'
>>>>>>> parent of 3b9fb57 (ユーザー認証)
  # Defines the root path route ("/")
  # root "articles#index"
end
