Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # Se quebrar voltar com a rota sem nestar :posts
  resources :groups, only: [:index, :show, :new, :create]
  resources :posts, only: [:index, :new, :create]

  resources :users, only: [:index, :show] do
    collection do
      get :feed
    end

    member do
      resources :chat_memberships, only: :index
    end
  end
  
  resources :chatrooms, only: [:show, :create] do
    resource :messages, only: :create
  end
end
