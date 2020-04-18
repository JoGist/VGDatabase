class GamesController < ApplicationController
skip_before_action :verify_authenticity_token

def homepage
    @user_id = session[:user_id]
end

def index
    @games = Game.all
end
end
