class GamesController < ApplicationController
skip_before_action :verify_authenticity_token

    def homepage
        @user = User.find(session[:user_id])
        @games = Game.all
    end

    def myLibrary
        @games = Mylibrary.all
    end

    def myLibraryFavorites
        @games = Game.all
    end

    def myLibraryEdit
        @games = Game.all
    end

    def myLibraryFavoritesEdit
        @games = Game.all
    end

    def search
    end

    def friends
        @user = User.find(session[:user_id])
    end

    def myProfile
        @user = User.find(session[:user_id])
    end

    def visitProfile
        @user = User.find(session[:user_id])
    end

    def editProfile
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
    end

    def deletingUser
        name = params[:user][:name]
        if User.exists?(User.where(:username => name))
            @user = User.where(:username => name)[0].id
            User.delete(@user)
            @result = 'Deleted'
            redirect_to settings_path
        end
        redirect_to deleteUser_path
    end


    def searchUser
    end

    def searchingUser
        user = params[:username]
        if User.exists?(User.where(:username => user))
            @users = User.where(:username => user)[0].id
            render html: 'user trovato'
        else
            render html: 'user non trovato'
        end
    end

    def searchGame
        @games = Game.all
    end

    
    def searchingGame
        search = params[:search]
        genre = params[:game][:genre]
        platform = params[:game][:platform]
        choice = params[:game][:choice]
        if choice == 'Title'
            if Game.exists?(Game.where(:title => search, :platform => platform, :genre => genre))
                @games = Game.where(:title => search, :platform => platform, :genre => genre)[0].id
                redirect_to game_path(@games)
            end
        elsif choice == 'Developer'
           if Game.exists?(Game.where(:developer => search))
                 @games = Game.where(:developer => search)
                 render html: ''
            end
        end         
    end
    
    
#admin

    def deleteReviewsGame
    end

    def deletingReviewsGame
        redirect_to settings_path
    end

    def deleteReviewsUser
    end

    def deletingReviewsUser
        redirect_to settings_path
    end
end
