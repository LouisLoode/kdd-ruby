Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root 'home#index'
  get 'main', to: 'home#main'

  resources :posts do
    resources :ranks
    # post 'ranks', to: 'rank#votes'
  end

  resources :cats

end
