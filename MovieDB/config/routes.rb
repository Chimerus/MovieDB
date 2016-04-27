Rails.application.routes.draw do
  resources :reviews
  resources :users
  resources :movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/movies/:friendly_url' => 'movies#show'
  root 'movies#index'

  post '/login' => 'application#login'
  get '/logout' => 'application#logout'
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
