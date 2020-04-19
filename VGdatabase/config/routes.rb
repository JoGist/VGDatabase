Rails.application.routes.draw do
get '/callback' => 'sessions#create'
get '/login' => 'sessions#login'
post '/login' => 'sessions#login'
delete '/login' => 'sessions#destroy'
get '/deleteAll' => 'games#deleteAll'
get '/settings' => 'games#settings'
get '/search' => 'games#search'
post '/search' => 'games#searching'
get '/search1' => 'games#search1'
get '/signup' => 'sessions#signup'
post '/signup' => 'sessions#signing'
get '/delete' => 'games#delete'
get '/main' => 'games#main'
get '/index' => 'reviews#index1'
get '/homepage' => 'games#homepage'
get '/homepage_guest' => 'games#homepageGuest'
get '/myLibrary' =>  'games#myLibrary'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#resources :movies do
    #resources :reviews
    #end

resources :games do
    resources :reviews
    end
end
