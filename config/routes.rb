Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :posts, only: [:index, :new, :create]
  resources :groups, only: [:index, :show, :new, :create]
  resources :users, only: [:index, :show] do
    collection do
      get 'feed'
    end
  end
end
