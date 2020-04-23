class MylibrariesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        game_id = params[:game_id]
        @games = Game.find(game_id)
        user_id = session[:user_id]
        @user = User.find(session[:user_id])
        @mylibrary = Mylibrary.new(:favorite => 'false')
        @mylibrary.user_id = @user.id
        @mylibrary.game_id = @games.id
        @mylibrary.save!
        redirect_to game_path(game_id)
        end
    end
end