Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "sessions#login"
  get '/login', to: 'sessions#login'
  post "/login", to: 'sessions#create'
  get '/register', to: 'users#new'
  post 'register', to: 'users#create'
  get "/random", to: 'movies#random'
  get "/longest", to: 'movies#longest'
  get "/rating", to: 'movies#rating'
  get "/popular", to: 'movies#popular'
  get '/letter/:letter', to:'movies#letter'
  get '/year_released/:year', to: 'movies#year_released'
  get '/title/:title', to: 'movies#title'
  get '/test', to: "movies#test"
  resources :movies


end
