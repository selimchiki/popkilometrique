Rails.application.routes.draw do

  root to:'sessions#home'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete 'sessions/destroy', to: "sessions#destroy"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
