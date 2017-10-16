Rails.application.routes.draw do

  root to:'sessions#home'

  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  get '/users/:id', to: "sessions#show", as: "user"
  get '/users/:id/edit', to: "sessions#edit", as: "edit_user"
  patch '/users/:id', to: "sessions#update"
  delete 'sessions/destroy', to: "sessions#destroy", as: "logout"

  get "/cars/new", to: "cars#new", as: "new_cars"
  post "/cars/new", to: "cars#create"
  get "fees/new", to: "fees#new", as: "new_fees"
  post "/fees/new", to: "fees#create"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
