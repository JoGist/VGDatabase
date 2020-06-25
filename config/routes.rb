Rails.application.routes.draw do
# Shared routes

root :to => 'sessions#login'

post '/callback' => 'sessions#create'
get '/login' => 'sessions#login'
post '/login' => 'sessions#login'
delete '/login' => 'sessions#destroy'
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

#Steam
post '/auth/steam/callback' => 'steams#auth_callback'

#Google
get 'auth/:provider/callback', to: 'googles#googleAuth'
get 'auth/failure', to: redirect('/')


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
post '/searchResult' => 'games#searchResult'
get '/deleteUser' => 'games#deleteUser'   #Serve all'user per cancellare il proprio profilo
get '/editProfile_success' => "games#editProfile_success"
get '/editProfile_error' => "games#editProfile_error"
get '/editAvatar' => 'games#editAvatar'
post 'editAvatar' => 'games#editingAvatar'
get '/deleteUserConfirmation' => 'games#deleteUserConfirmation'
get '/searchUser' => 'games#searchUser'
post '/searchUser' => 'games#searchingUser'
get '/searchGame' => 'games#searchGame'
post '/searchGame' => 'games#searchResult'
get '/searchUserError' => 'games#searchUserError'
post '/searchUserError' => 'games#searchingUser'
get '/editProfileOauth' => 'games#editProfileOauth'
post '/editProfileOauth' => 'games#editingProfileOauth'
get '/editProfileOauth_error' => "games#editProfileOauth_error"
get '/editProfileOauth_success' => "games#editProfileOauth_success"
get '/removeOauthSteam' => 'games#removeOauthSteam'
get '/removeOauthGoogle' => 'games#removeOauthGoogle'

# Guest routes
get '/homepage_guest' => 'sessions#homepageGuest'
get '/contactUs_guest' => 'sessions#contactUsGuest'
get '/search_guest_user' => 'sessions#searchGuestUser'
post '/search_guest_user' => 'sessions#searchingGuestUser'
get '/search_guest_game' => 'sessions#searchGuestGame'
post '/search_guest_game' => 'sessions#searchResult'
get '/search_result_guest' => 'sessions#searchResultGuest'
get '/search_user_error_guest' => 'sessions#searchUserErrorGuest'
post '/search_user_error_guest' => 'sessions#searchingGuestUser'

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

get '/deleteGameLibrary' => 'games#deleteGameLibrary'
post '/deleteGameLibrary' => 'games#deletingGameLibrary'
get '/deleteGameLibrary_success' => 'games#deleteGameLibrary_success'
get '/deleteGameLibrary_error' => 'games#deleteGameLibrary_error'
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
