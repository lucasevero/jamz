Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :groups, only: [:index, :show, :new, :create]
  resources :users, only: [:show] do
  end
end
