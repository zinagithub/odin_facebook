Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  get 'user/:id/friends', to: 'users#friends', as: 'user_friends'
  resources :users
  resources :posts
  resources :friend_requests, only: %i[index new create  destroy]
  root to: 'users#index'
end
