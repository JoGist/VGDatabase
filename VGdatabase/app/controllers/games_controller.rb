class GamesController < ApplicationController
skip_before_action :verify_authenticity_token

def homepage
    @user = User.find(session[:user_id])
end

def myLibrary
end

def search
end

def friends
end

def myProfile
    @user = User.find(session[:user_id])
end

# GUEST PART


def index
    @games = Game.all
end
end
