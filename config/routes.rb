Rails.application.routes.draw do

  root to:'sessions#home'

  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  get '/users/:id', to: "sessions#show", as: "user"
  get '/users/:id/edit', to: "sessions#edit", as: "edit_user"
  patch '/users/:id', to: "sessions#update"
  delete 'sessions/destroy', to: "sessions#destroy", as: "logout"

  post "/cars/new", to: "cars#create", as: "new_cars"
  resources :trajets
  post "/trajets/new", to: "trajets#create"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
