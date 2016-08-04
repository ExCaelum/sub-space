Rails.application.routes.draw do

  root :to => "users#index"
  get '/auth/google_oauth2/callback', to: "sessions#create"
  get '/auth/google_oauth2', as: "google_login"
  get '/dashboard', as: "dashboard", to: "users#index"
  get '/setup', as: 'setup', to: "setup#show"
  delete '/logout', to: 'sessions#destroy'
  resources :categories, only: [:show]


  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :categories, only: [:create]
      resources :subscriptions, only: [:update]
    end
  end


end
