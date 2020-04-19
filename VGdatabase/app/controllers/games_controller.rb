class GamesController < ApplicationController
skip_before_action :verify_authenticity_token

def homepage
    @user = User.find(session[:user_id]) 
end

def myLibrary
end

def homepageGuest
end

def index
    @games = Game.all
end
end