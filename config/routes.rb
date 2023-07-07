Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  get '/recipes/list-display', to: 'recipes#list_display', as: 'list_display'
  Rails.application.routes.draw do
  get '/gachas/index', to: 'gachas#index'
  get '/recipes/search', to: 'recipes#search', as: 'search_recipes'
  end
  resources :users
  resources :users, only: :show
  resources :recipes do
   resource :comments, only: :create
   resource :likes, only: [:create, :destroy]
   collection do
    get 'search'
  end
  end
end
