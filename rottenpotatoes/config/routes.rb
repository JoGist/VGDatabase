Rails.application.routes.draw do
get '/callback' => 'sessions#create'
get '/login' => 'sessions#login'
get '/deleteAll' => 'movies#deleteAll'
get '/settings' => 'movies#settings'
get '/search' => 'movies#search'
post '/search' => 'movies#searching'
get '/search1' => 'movies#search1'
get '/signup' => 'sessions#signup'
post '/signup' => 'sessions#signing'
get '/delete' => 'movies#delete'
get '/main' => 'movies#main'
get '/index' => 'reviews#index1'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :movies do
    resources :reviews
    end

end
