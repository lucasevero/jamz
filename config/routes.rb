Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "users/registrations"}
  root to: 'pages#home'

  # Se quebrar voltar com a rota sem nestar :posts
  resources :groups, only: [:index, :show, :new, :create]
  resources :posts, only: [:index, :new, :create] do
    member do
      resouces :likes, only: :create
    end
  end

  resources :users, only: [:index, :show] do
    collection do
      get :feed
    end

    member do
      resources :chat_memberships, only: :index
    end
  end

  resources :chatrooms, only: [:show, :create] do
    resources :messages, only: :create
  end
end
