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
  
  get 'categories/autocomplete', to: 'categories#autocomplete'
  get 'posts/autocomplete', to: 'posts#autocomplete'
  get 'user/autocomplete', to: 'users#autocomplete'

  resources :rates, only: :update
  resources :posts

  # resources :categories, only: :index do
  resources :categories

end
