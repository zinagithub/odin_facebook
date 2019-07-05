Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  get 'user/:id/friends', to: 'users#friends', as: 'user_friends'
  resources :users
  resources :posts do
  	resources :comments
  end
  resources :comments, only: [:create, :destroy]
  resources :friend_requests, only: [:index, :create, :destroy]
  resources :friendships, only: [:index, :create, :destroy]
  resources :likes, only: [:create, :destroy]
  root to: 'posts#index'
end
