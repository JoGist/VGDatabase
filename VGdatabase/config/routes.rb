Rails.application.routes.draw do
get '/callback' => 'sessions#create'
get '/login' => 'sessions#login'
post '/login' => 'sessions#login'
delete '/login' => 'sessions#destroy'
get '/deleteAll' => 'games#deleteAll'
get '/settings' => 'games#settings'
get '/search' => 'games#search'
post '/search' => 'games#searching'
get '/signup' => 'sessions#signup'
post '/signup' => 'sessions#signing'
get '/delete' => 'games#delete'
get '/homepage' => 'games#homepage'
get '/homepage_guest' => 'sessions#homepageGuest'
get '/myLibrary' =>  'games#myLibrary'
get '/myLibraryFavorites' => 'games#myLibraryFavorites'
get '/friends' => 'games#friends'
get '/myProfile' => 'games#myProfile'
get '/contactUs' => 'sessions#contactUs'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#resources :movies do
    #resources :reviews
    #end

resources :games do
    resources :reviews
    end
end
