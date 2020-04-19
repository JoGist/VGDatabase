class GamesController < ApplicationController
skip_before_action :verify_authenticity_token

    def homepage
        @user = User.find(session[:user_id])
        @games = Game.all
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

    def show
        id = params[:id]
        @games = Game.find(id)
    end

    def contactUs
    end

    def settings
    end

    def deleteUser
        name = params[:user][:name]
        @user = User.where(:username => name)[0].id
        User.delete(@user)
        @result = 'Deleted'
        redirect_to settings_path
    end

    def 

end
