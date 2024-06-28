Rails.application.routes.draw do
  resources :orders
  resources :products
  resources :sellers
  resources :buyers
  resources :users
  # Routes pour l'inscription
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  # Routes pour la connexion
  get '/login', to: 'users#login'
  post '/login', to: 'users#login_process'

  # Route pour la déconnexion
  get '/logout', to: 'users#logout'
end
