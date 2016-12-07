Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root 'home#index'
  get 'main', to: 'home#main'
  resources :users
  get 'users/list', to: 'users#list'
  get 'user/:user_id', to: 'users#show', as: 'show_user'
  get 'post/:post_id/user/:user_id/rank/:note', to: 'ranks#create', as: 'ranks_create'

  resources :posts do
    resources :ranks
    # post 'ranks', to: 'rank#votes'
  end

  resources :categories

end
