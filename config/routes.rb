Rails.application.routes.draw do

  root 'home#index'
  get 'main', to: 'home#main'
  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }
  # resources :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  get 'users/list', to: 'users#list'
  get 'users/:user_id', to: 'users#show', as: 'show_user'
  get 'profile', to: 'users#show', as: 'show_profile'
  get 'post/:post_id/rate/:score', to: 'rates#create', as: 'rates_create'
  get 'post/:post_id/favorite', to: 'favorites#create', as: 'favorites_create'
  get 'post/:post_id/unfavorite', to: 'favorites#delete', as: 'favorites_delete'
  get 'user/:user_id/favorites', to: 'favorites#show', as: 'favorites_user'

  get 'categories/autocomplete', to: 'categories#autocomplete'
  get 'posts/autocomplete', to: 'posts#autocomplete'
  get 'user/autocomplete', to: 'users#autocomplete'

  resources :posts

  # resources :categories, only: :index do
  resources :categories

end
