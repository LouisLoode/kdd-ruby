Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  root 'home#index'
  get 'main', to: 'home#main'
  get 'profil', to: 'pages#profil'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
