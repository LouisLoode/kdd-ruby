Rails.application.routes.draw do
  root 'home#index'
  get 'main', to: 'home#main'
  get 'users', to: 'profil#list'
  get 'profil', to: 'pages#profil'

  devise_for :users, :controllers => {
          registrations: 'users/registrations'
      }
  resources :users


  resources :posts do
    resources :ranks
    # post 'ranks', to: 'rank#votes'
  end

  resources :cats

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
