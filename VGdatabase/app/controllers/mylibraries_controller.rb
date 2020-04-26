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
        redirect_to myLibrary_path
    end

    def destroy
        id = params[:id]
		@mygame = Mylibrary.find(id)
        @mygame.destroy
        redirect_to editLibrary_path
    end

    def update
        id = params[:id]
        @mygame = Mylibrary.find(id)
        if @mygame.favorite == "false"
            @mygame.update_attributes!(:favorite => "true")
            redirect_to myLibraryFavorites_path
        else
            @mygame.update_attributes!(:favorite => "false")   
            redirect_to myLibraryFavorites_path
        end
    end
end