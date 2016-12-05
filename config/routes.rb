Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root 'home#index'
  get 'main', to: 'home#main'
  get 'users/list', to: 'users#list'
  get 'user/:user_id', to: 'users#show', as: 'show_user'

  resources :posts do
    resources :ranks
    # post 'ranks', to: 'rank#votes'
  end

  resources :cats

end
