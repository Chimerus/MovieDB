Rails.application.routes.draw do
  resources :reviews
  resources :users
  resources :movies
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/movies/:friendly_url' => 'movies#show'
  root 'movies#index'

  post '/login' => 'application#login'
  get '/logout' => 'application#logout'

  get '/review/new/:id' => 'reviews#new'

  # if they refresh the search page, sends back to home
  get '/movie/search' => 'movies#index'
  post '/movie/search' => 'movies#search'

  # friendly url implemented, but don't want to eliminate the original id resources
  get "/movie/:friendly_url" => 'movies#show_friendly'

  # the Gmail Oauth callback route
  get "/auth/:provider/callback" => 'application#create'
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
