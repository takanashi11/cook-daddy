Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "recipes#index"
  get '/recipes/list-display', to: 'recipes#list_display', as: 'list_display'
  Rails.application.routes.draw do
  get '/gachas/index', to: 'gachas#index'
  end
  resources :users
  resources :recipes do
   resource :comments, only: :create
   resource :likes, only: [:create, :destroy]
  end
end
