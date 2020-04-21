class MylibrariesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        redirect_to homepage_path
    end
    def create
        game_id = params[:game_id]
        user_id = session[:user_id]
        @game = Game.find(game_id)
        @mylibrary = Mylibrary.new(:favorite => 'false')
        @mylibrary.user_id = user_id
        @mylibrary.game_id = game_id
        @mylibrary.favorite = 'false'
        @mylibrary.save
        redirect_to game_path(game_id)
    end
end