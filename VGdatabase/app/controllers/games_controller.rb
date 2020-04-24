class GamesController < ApplicationController
skip_before_action :verify_authenticity_token

    def homepage
        @user = User.find(session[:user_id])
        @games = Game.all
        @library = Mylibrary.where(:user_id => @user.id)
    end

    def myLibrary
        @library = Mylibrary.all
        @user = User.find(session[:user_id])
    end

    def myLibraryFavorites
        @library = Mylibrary.where(:favorite => "true")
        @user = User.find(session[:user_id])
    end

    def myLibraryEdit
        @mylibrary = Mylibrary.all
        @user = User.find(session[:user_id])
    end

    def myLibraryFavoritesEdit
        @mylibrary = Mylibrary.where(:favorite => "true")
        @user = User.find(session[:user_id])
    end

    def search
    end

    def friends
        @user = User.find(session[:user_id])
    end

    def myProfile
        @user = User.find(session[:user_id])
        @review = Review.where(:user_id => @user)
        @game = Game.find(Review.where(:user_id => @user)[0].game_id)
    end

    def visitProfile
        @user = User.find(session[:user_id])
    end

    def editProfile
        @user = User.find(session[:user_id])
    end

    def editingProfile
        username = params[:user][:name]
        email = params[:user][:email]
        oldp = params[:user][:oldp]
        newp = params[:user][:newp]
        newp1 = params[:user][:newp1]
        @user = User.find(session[:user_id])
        if username.length==0 && email.length==0 && oldp.length==0 && newp.length==0 && newp1.length==0
            redirect_to myProfile_path
        elsif username.length==0 && email.length==0 && newp.length!=0 && newp==newp1 && oldp==@user.password
            @user.update_attributes!(:password => newp)
            redirect_to editProfile_success_path
        elsif username.length!=0 && email.length==0 && newp.length!=0 && newp==newp1 && oldp==@user.password
            @user.update_attributes!(:password => newp, :username => username)
            redirect_to editProfile_success_path
        elsif username.length!=0 && email.length!=0 && newp.length!=0 && newp==newp1 && oldp==@user.password
            @user.update_attributes!(:password => newp, :username => username, :email => email)
            redirect_to editProfile_success_path
        elsif username.length!=0 && email.length==0 && oldp.length==0
            @user.update_attributes!(:username => username)
            redirect_to editProfile_success_path        
        elsif username.length==0 && email.length!=0 && oldp.length==0
            @user.update_attributes!(:email => email)
            redirect_to editProfile_success_path      
        elsif username.length!=0 && email.length!=0 && oldp.length==0
            @user.update_attributes!(:email => email, :username => username)
            redirect_to editProfile_success_path                                       
        else
            redirect_to editProfile_error_path        
        end
    end

    def editProfile_success
        @user = User.find(session[:user_id])
    end

    def editProfile_error
        @user = User.find(session[:user_id])
    end

    def show
        id = params[:id]
        @games = Game.find(id)
        @library = Mylibrary.where(:user_id => session[:user_id])
        @user = session[:user_id]
        @review = Review.where(:game_id => @games)
    end

    def contactUs
    end

    def settings
    end

    def deleteUser
        name = session[:user_id]
        User.delete(name)
        redirect_to login_path
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

    def deleteReviewsGame_success
    end

    def deleteReviewsGame_error
    end

    def deletingReviewsGame
        redirect_to settings_path
    end

    def deleteReviewsUser
    end

    def deleteReviewsUser_success
    end

    def deleteReviewsUser_error
    end

    def deletingReviewsUser
        redirect_to settings_path
    end

    def deletingUser
    end

    def deletingUser_success
    end

    def deletingUser_error
    end

    def deletingAdminUser
        name = params[:user][:name]
        if User.exists?(User.where(:username => name))
            @user = User.where(:username => name)[0].id
            User.delete(@user)
            @result = 'Deleted'
            redirect_to deletingUser_success_path
        else
            redirect_to deletingUser_error_path
        end
    end
end
