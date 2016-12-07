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
  resources :relationships,       only: [:create, :destroy]
  get 'users/list', to: 'users#list'
  get 'user/:user_id', to: 'users#show', as: 'show_user'
  get 'post/:post_id/rate/:note', to: 'rates#create', as: 'rates_create'
  resources :rates, only: :update
  resources :posts

  resources :categories

end
