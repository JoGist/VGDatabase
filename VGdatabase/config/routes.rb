Rails.application.routes.draw do
# Shared routes
get '/callback' => 'sessions#create'
get '/login' => 'sessions#login'
post '/login' => 'sessions#login'
delete '/login' => 'sessions#destroy'
get '/searchUser' => 'games#searchUser'
post '/searchUser' => 'games#searchingUser'
get '/searchGame' => 'games#searchGame'
post '/searchGame' => 'games#searchingGame'
get '/signup' => 'sessions#signup'
post '/signup' => 'sessions#signing'
get '/login_error' => 'sessions#login_error'
get '/forgot_password' => 'sessions#forgot_password'


# User routes
get '/homepage' => 'games#homepage'
get '/myLibrary' =>  'games#myLibrary'
get '/myLibraryFavorites' => 'games#myLibraryFavorites'
get '/editLibrary' => 'games#myLibraryEdit'
get '/friends' => 'games#friends'
get '/myProfile' => 'games#myProfile'
get '/editProfile' => 'games#editProfile'
get '/contactUs' => 'games#contactUs'
get '/delete' => 'games#delete'       #Serve all'user per cancellare il proprio profilo 

# Guest routes 
get '/homepage_guest' => 'sessions#homepageGuest'
get '/contactUs_guest' => 'sessions#contactUsGuest'
get '/search_guest_user' => 'sessions#searchGuestUser'
post '/search_guest_user' => 'sessions#searchingGuestUser'
get '/search_guest_game' => 'sessions#searchGuestGame'
post '/search_guest_game' => 'sessions#searchingGuestGame'

# Games routes
# Qualcosa sulle review

# Admin routes
get '/settings' => 'games#settings'
get '/deleteUser' => 'games#deleteUser'
post '/deleteUser' => 'games#deletingUser'
get '/deleteReviewsUser' => 'games#deleteReviewsUser'
post '/deleteReviewsUser' => 'games#deletingReviewsUser'
get '/deleteReviewsGame' => 'games#deleteReviewsGame'
post '/deleteReviewsGame' => 'games#deletingReviewsGame'
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
