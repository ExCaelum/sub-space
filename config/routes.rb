Rails.application.routes.draw do

  root :to => "root#show"
  get '/auth/google_oauth2/callback', to: "sessions#create"
  get '/auth/google_oauth2', as: "google_login"
  get '/dashboard', as: "dashboard", to: "users#show"
  get '/setup', as: 'setup', to: "setup#show"

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :categories, only: [:create]
    end
  end


end
