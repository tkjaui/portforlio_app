Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  devise_for :users
  root to: "home#index"
  resources :users #この１行でusersに関する必要なルーティングが作られる
  resources :services #この１行でservicesに関する必要なルーティングが作られる
  resources :posts
  resources :service do
    resources :comments, only: [:create]
  end
end
