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
post '/signup' => 'sessions#signin'
get '/signup_error_mail' => 'sessions#signup_error_mail'
get '/signup_error_username' => 'sessions#signup_error_username'
get '/signup_error_password' => 'sessions#signup_error_password'
get '/login_error' => 'sessions#login_error'
get '/forgot_password' => 'sessions#forgot_password'
post '/forgot_password' => 'sessions#change_password'
get '/forgot_password_error' => 'sessions#forgot_password_error'
get '/forgot_password_error_password' => 'sessions#forgot_password_error_password'


# User routes
get '/homepage' => 'games#homepage'
get '/myLibrary' =>  'games#myLibrary'
get '/myLibraryFavorites' => 'games#myLibraryFavorites'
get '/editLibrary' => 'games#myLibraryEdit'
get '/editFavorites' => 'games#myLibraryFavoritesEdit'
get '/friends' => 'games#friends'
get '/myProfile' => 'games#myProfile'
get '/editProfile' => 'games#editProfile'
post '/editProfile' => 'games#editingProfile'
get '/contactUs' => 'games#contactUs'
get '/searchResult' => 'games#searchResult'
get '/deleteUser' => 'games#deleteUser'   #Serve all'user per cancellare il proprio profilo
get '/editProfile_success' => "games#editProfile_success"
get '/editProfile_error' => "games#editProfile_error"
get '/editAvatar' => 'games#editAvatar'
post 'editAvatar' => 'games#editingAvatar'

# Guest routes
get '/homepage_guest' => 'sessions#homepageGuest'
get '/contactUs_guest' => 'sessions#contactUsGuest'
get '/search_guest_user' => 'sessions#searchGuestUser'
post '/search_guest_user' => 'sessions#searchingGuestUser'
get '/search_guest_game' => 'sessions#searchGuestGame'
post '/search_guest_game' => 'sessions#searchingGuestGame'
get '/search_result_guest' => 'sessions#searchResultGuest'

# Games routes
# Qualcosa sulle review

# Admin routes
get '/settings' => 'games#settings'

get '/deletingUser' => 'games#deletingUser'
post '/deletingUser' => 'games#deletingAdminUser'
get '/deletingUser_success' => 'games#deletingUser_success'
get '/deletingUser_error' => 'games#deletingUser_error'

get '/deleteReviewsUser' => 'games#deleteReviewsUser'
post '/deleteReviewsUser' => 'games#deletingReviewsUser'
get '/deleteReviewsUser_success' => 'games#deleteReviewsUser_success'
get '/deleteReviewsUser_error' => 'games#deleteReviewsUser_error'

get '/deleteReviewsGame' => 'games#deleteReviewsGame'
post '/deleteReviewsGame' => 'games#deletingReviewsGame'
get '/deleteReviewsGame_success' => 'games#deleteReviewsGame_success'
get '/deleteReviewsGame_error' => 'games#deleteReviewsGame_error'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#resources :movies do
    #resources :reviews
    #end

resources :games do
  resources :reviews
  resources :mylibraries
end

namespace :guest do
  resources :show , only: [:show]
end

namespace :visit do
  resources :profile, only: [:show]
end

resources :users do
  resources :reviews
end

resources :friends

end
