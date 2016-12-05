Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root 'home#index'
  get 'main', to: 'home#main'
  get 'users', to: 'profil#list'
  get 'profil', to: 'pages#profil'
  resources :users

  resources :posts do
    resources :ranks
    # post 'ranks', to: 'rank#votes'
  end

  resources :categories

end
