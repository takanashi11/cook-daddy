Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  get '/recipes/list-display', to: 'recipes#list_display', as: 'list_display'
  resources :recipes
end
