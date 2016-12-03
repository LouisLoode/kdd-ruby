Rails.application.routes.draw do
  get 'pages/profil'

  root 'home#index'
  get 'main', to: 'home#main'
  get 'profil', to: 'pages#profil'
  devise_for :users
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
