Rails.application.routes.draw do
  resources :movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/movies/:friendly_url' => 'movies#show'
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
