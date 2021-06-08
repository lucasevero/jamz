Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :posts, only: [:new, :create]
  resources :groups, only: [:index, :show, :new, :create]
end
