Rails.application.routes.draw do

  root :to => "root#show"
  get '/auth/google_oauth2/callback', to: "sessions#create"
  get '/auth/google_oauth2', as: "google_login"


end
