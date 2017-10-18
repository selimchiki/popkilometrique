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
  get "/cars/:id/edit", to:"cars#edit", as: "car"
  patch "/cars/:id/edit", to: "cars#update"

  put "/cars/:id", to: "cars#desactivation", as: "desactivation_car"
  get "fees/new", to: "fees#new", as: "new_fees"
  post "/fees/new", to: "fees#create"
  get "/fees/:id", to: "fees#show", as: "fee"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
