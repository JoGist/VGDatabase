Rails.application.routes.draw do
# Shared routes
get '/callback' => 'sessions#create'
get '/login' => 'sessions#login'
post '/login' => 'sessions#login'
delete '/login' => 'sessions#destroy'
get '/search' => 'games#search'
post '/search' => 'games#searching'
get '/signup' => 'sessions#signup'
post '/signup' => 'sessions#signing'

# User routes
get '/homepage' => 'games#homepage'
get '/myLibrary' =>  'games#myLibrary'
get '/myLibraryFavorites' => 'games#myLibraryFavorites'
get '/friends' => 'games#friends'
get '/myProfile' => 'games#myProfile'
get '/contactUs' => 'games#contactUs'
get '/delete' => 'games#delete'       #Serve all'user per cancellare il proprio profilo 

# Guest routes 
get '/homepage_guest' => 'sessions#homepageGuest'
get '/contactUs_guest' => 'sessions#contactUsGuest'
get '/search_guest' => 'sessions#searchGuest'

# Games routes
# Qualcosa sulle review

# Admin routes
get '/deleteUser' => 'games#deleteUser'
get '/settings' => 'games#settings'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#resources :movies do
    #resources :reviews
    #end

resources :games do
  resources :reviews
end

resources :users do
  resources :reviews
end

end
