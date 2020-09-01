Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users #この１行でusersに関する必要なルーティングが作られる
  resources :services #この１行でservicesに関する必要なルーティングが作られる
end
