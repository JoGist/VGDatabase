class GamesController < ApplicationController
skip_before_action :set_current_user
skip_before_action :verify_authenticity_token
    require 'apicalypse'
    require 'rubygems'
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
        @friends = Friend.where(:user_id => @user.id, :favorite => 'true')
        @friends1 = Friend.where(:user_id => @user.id, :favorite => 'false')
    end

    def myProfile
        @user = User.find(session[:user_id])
        @review = Review.where(:user_id => @user)
        @friends = Friend.where(:user_id => @user.id,:favorite => 'true')
        @friends1 = Friend.where(:user_id => @user.id,:favorite => 'false')
    end

    def editProfile
        @user = User.find(session[:user_id])
        @review = Review.where(:user_id => @user)
        @friends = Friend.where(:user_id => @user.id)
    end

    def editProfileOauth
        @user = User.find(session[:user_id])
        @review = Review.where(:user_id => @user)
        @friends = Friend.where(:user_id => @user.id)
    end

    def editingProfileOauth
        username = params[:user][:name]
        email = params[:user][:email]
        newp = params[:user][:newp]
        newp1 = params[:user][:newp1]
        @user = User.find(session[:user_id])
        if username.length==0 && email.length==0 && newp.length==0 && newp1.length==0
            redirect_to editProfileOauth_error_path
        elsif username.length!=0 && email.length!=0 && newp.length!=0 && newp==newp1
            @user.update_attributes!(:username => username, :email => email, :password => newp)
            redirect_to editProfileOauth_success_path
        elsif username.length!=0 && email.length!=0 && newp.length==0 && newp1.length==0
            @user.update_attributes!(:username => username, :email => email)
            redirect_to editProfileOauth_success_path
        else
            redirect_to editProfileOauth_error_path
        end
    end

    def editProfileOauth_error
        @user = User.find(session[:user_id])
        @review = Review.where(:user_id => @user)
        @friends = Friend.where(:user_id => @user.id)
    end

    def editProfileOauth_success
        @user = User.find(session[:user_id])
        @review = Review.where(:user_id => @user)
        @friends = Friend.where(:user_id => @user.id)
    end

    def editAvatar
        @avatar = Avatar.all
    end

    def editingAvatar
        @user = User.find(session[:user_id])
        avatar = params[:avatar]
        @user.update_attributes!(:avatar => avatar)
        redirect_to myProfile_path
    end

    def editingProfile
        username = params[:user][:name]
        email = params[:user][:email]
        oldp = params[:user][:oldp]
        newp = params[:user][:newp]
        newp1 = params[:user][:newp1]
        @user = User.find(session[:user_id])
        if username.length==0 && email.length==0 && oldp.length==0 && newp.length==0 && newp1.length==0
            redirect_to editProfile_error_path
        elsif username.length!=0 && email.length!=0 && newp.length!=0 && newp==newp1 && oldp==@user.password
            @user.update_attributes!(:username => username, :email => email, :password => newp)
            redirect_to editProfile_success_path
        elsif username.length!=0 && email.length!=0 && oldp.length==0 && newp.length==0 && newp1.length==0
            @user.update_attributes!(:username => username, :email => email)
            redirect_to editProfile_success_path
        else
            redirect_to editProfile_error_path
        end
    end

    def editProfile_success
        @user = User.find(session[:user_id])
        @review = Review.where(:user_id => @user)
        @friends = Friend.where(:user_id => @user.id)
    end

    def editProfile_error
        @user = User.find(session[:user_id])
        @review = Review.where(:user_id => @user)
        @friends = Friend.where(:user_id => @user.id)
    end

    def deleteUserConfirmation
        @user = User.find(session[:user_id])
        @review = Review.where(:user_id => @user)
        @friends = Friend.where(:user_id => @user.id)
    end

    def show
        id = params[:id]
        @games = Game.find(id)
        @library = Mylibrary.where(:user_id => session[:user_id])
        @user = session[:user_id]
        @aux = Review.where(:game_id => @games)
        @aux = @aux.where('user_id != ?', @user)
        @review = Review.where(:game_id => @games, :user_id => @user)
    end

    def contactUs
        @user = User.find(session[:user_id])
    end

    def deleteUser
        name = session[:user_id]
        @friends = Friend.where(:user_id => name)
        @friends.each do |friend|
            friend.delete
        end
        @friends1 = Friend.where(:friend_id => name)
        @friends1.each do |friend|
            friend.delete
        end
        @review = Review.where(:user_id => name)
        @review.each do |review|
            review.delete
        end
        @library = Mylibrary.where(:user_id => name)
        @library.each do |library|
            library.delete
        end
        session.delete(:user_id)
        User.delete(name)
        redirect_to login_path
    end



    def searchUser
        @user = User.find(session[:user_id])
    end

    def searchUserError
        @user = User.find(session[:user_id])
    end

    def searchingUser
        user = params[:username]
        if User.exists?(User.where(:username => user))
            if user==User.find(session[:user_id]).username
                @users = User.where(:username => user)[0].id
                redirect_to myProfile_path
            else
                @users = User.where(:username => user)[0].id
                redirect_to visit_profile_path(@users)
            end
        else
            redirect_to searchUserError_path
        end
    end

    def searchGame
        @games = Game.all
        @user = User.find(session[:user_id])
    end


    def searchResult
        @search = params[:search]
        genre = params[:game][:genre]
        @user = User.find(session[:user_id])
        if genre == 'Genre'
            api_endpoint = 'https://api-v3.igdb.com/games'
            request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
            api = Apicalypse.new(api_endpoint, request_headers)
            api.fields(:cover,:genres,:name,:platforms).search(@search).limit(12).request
            @result = api.request
            @genre_requested = 0

        elsif genre == 'Arcade'  
            api_endpoint = 'https://api-v3.igdb.com/games'
            request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
            api = Apicalypse.new(api_endpoint, request_headers)
            api.fields(:cover,:genres,:name,:platforms).search(@search).limit(12).request   
            @games = api.request 
            @result = []
            @genre_requested = 33
            @games.each do |game|
                if game.keys.include?('cover') && game.keys.include?('genres') && game.keys.include?('platforms')
                    if game.values[2].include?(33)
                        @result.push(game)
                    end
                end
            end

        elsif genre == 'Adventure'  
            api_endpoint = 'https://api-v3.igdb.com/games'
            request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
            api = Apicalypse.new(api_endpoint, request_headers)
            api.fields(:cover,:genres,:name,:platforms).search(@search).limit(12).request
            @games = api.request
            @result = []
            @genre_requested = 31
            @games.each do |game|
                if game.keys.include?('cover') && game.keys.include?('genres') && game.keys.include?('platforms')
                    if game.values[2].include?(31)
                        @result.push(game)
                    end
                end
            end
        
        elsif genre == 'Fighting'  
            api_endpoint = 'https://api-v3.igdb.com/games'
            request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
            api = Apicalypse.new(api_endpoint, request_headers)
            api.fields(:cover,:genres,:name,:platforms).search(@search).limit(12).request   
            @games = api.request 
            @result = []
            @genre_requested = 4
            @games.each do |game|
                if game.keys.include?('cover') && game.keys.include?('genres') && game.keys.include?('platforms')
                    if game.values[2].include?(4)
                        @result.push(game)
                    end
                end
            end
        
        elsif genre == 'Platform'  
            api_endpoint = 'https://api-v3.igdb.com/games'
            request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
            api = Apicalypse.new(api_endpoint, request_headers)
            api.fields(:cover,:genres,:name,:platforms).search(@search).limit(12).request   
            @games = api.request 
            @result = []
            @genre_requested = 8
            @games.each do |game|
                if game.keys.include?('cover') && game.keys.include?('genres') && game.keys.include?('platforms')
                    if game.values[2].include?(8)
                        @result.push(game)
                    end
                end
            end

        elsif genre == 'Puzzle'  
            api_endpoint = 'https://api-v3.igdb.com/games'
            request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
            api = Apicalypse.new(api_endpoint, request_headers)
            api.fields(:cover,:genres,:name,:platforms).search(@search).limit(12).request   
            @games = api.request 
            @result = []
            @genre_requested = 9
            @games.each do |game|
                if game.keys.include?('cover') && game.keys.include?('genres') && game.keys.include?('platforms')
                    if game.values[2].include?(9)
                        @result.push(game)
                    end
                end
            end
            
        elsif genre == 'Racing'  
            api_endpoint = 'https://api-v3.igdb.com/games'
            request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
            api = Apicalypse.new(api_endpoint, request_headers)
            api.fields(:cover,:genres,:name,:platforms).search(@search).limit(12).request   
            @games = api.request 
            @result = []
            @genre_requested = 10
            @games.each do |game|
                if game.keys.include?('cover') && game.keys.include?('genres') && game.keys.include?('platforms')
                    if game.values[2].include?(10)
                        @result.push(game)
                    end
                end
            end

        elsif genre == 'RPG'  
            api_endpoint = 'https://api-v3.igdb.com/games'
            request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
            api = Apicalypse.new(api_endpoint, request_headers)
            api.fields(:cover,:genres,:name,:platforms).search(@search).limit(12).request
            @games = api.request
            @result = []
            @genre_requested = 12
            @games.each do |game|
                if game.keys.include?('cover') && game.keys.include?('genres') && game.keys.include?('platforms')
                    if game.values[2].include?(12)
                        @result.push(game)
                    end
                end
            end

        elsif genre == 'Shooter'  
            api_endpoint = 'https://api-v3.igdb.com/games'
            request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
            api = Apicalypse.new(api_endpoint, request_headers)
            api.fields(:cover,:genres,:name,:platforms).search(@search).limit(12).request
            @games = api.request
            @result = []
            @genre_requested = 5
            @games.each do |game|
                if game.keys.include?('cover') && game.keys.include?('genres') && game.keys.include?('platforms')
                    if game.values[2].include?(5)
                        @result.push(game)
                    end
                end
            end

        elsif genre == 'Simulator'  
            api_endpoint = 'https://api-v3.igdb.com/games'
            request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
            api = Apicalypse.new(api_endpoint, request_headers)
            api.fields(:cover,:genres,:name,:platforms).search(@search).limit(12).request
            @games = api.request
            @result = []
            @genre_requested = 13
            @games.each do |game|
                if game.keys.include?('cover') && game.keys.include?('genres') && game.keys.include?('platforms')
                    if game.values[2].include?(13)
                        @result.push(game)
                    end
                end
            end

        elsif genre == 'Sport'  
            api_endpoint = 'https://api-v3.igdb.com/games'
            request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
            api = Apicalypse.new(api_endpoint, request_headers)
            api.fields(:cover,:genres,:name,:platforms).search(@search).limit(12).request
            @games = api.request
            @result = []
            @genre_requested = 14
            @games.each do |game|
                if game.keys.include?('cover') && game.keys.include?('genres') && game.keys.include?('platforms')
                    if game.values[2].include?(14)
                        @result.push(game)
                    end
                end
            end
        end
    end


#admin

    def settings
        @users = User.all
        @reviews = Review.all
        @libraries = Mylibrary.all
    end

    def deleteReviewsGame
    end

    def deleteReviewsGame_success
    end

    def deleteReviewsGame_error
    end

    def deletingReviewsGame
        game1 = params[:game][:title]
        if(Game.exists?(:title => game1))
            @game = Game.where(:title => game1)[0].id
            if(Review.exists?(:game_id => @game))
                @review = Review.where(:game_id => @game)
                @review.each do |review|
                    Review.delete(review.id)
                end
                redirect_to deleteReviewsGame_success_path
            else
                redirect_to deleteReviewsGame_error_path
            end
        else
            redirect_to deleteReviewsGame_error_path
        end
    end

    def deleteReviewsUser
    end

    def deleteReviewsUser_success
    end

    def deleteReviewsUser_error
    end

    def deletingReviewsUser
        user1 = params[:user][:name]
        game1 = params[:game][:title]
        if(User.exists?(:username => user1) && Game.exists?(:title => game1))
            @user = User.where(:username => user1)[0].id
            @game = Game.where(:title => game1)[0].id
            if(Review.exists?(:user_id => @user,:game_id => @game))
                @review = Review.where(:user_id => @user,:game_id => @game)[0].id
                Review.delete(@review)
                redirect_to deleteReviewsUser_success_path
            else
                redirect_to deleteReviewsUser_error_path
            end
        else
            redirect_to deleteReviewsUser_error_path
        end
    end

    def deletingUser
    end

    def deletingAdminUser
        name = params[:user][:name]
        if name == 'admin'
            redirect_to deletingUser_error_path
        else
            if User.exists?(User.where(:username => name))
                @user = User.where(:username => name)[0].id
                @friends = Friend.where(:user_id => @user)
                @friends.each do |friend|
                    friend.delete
                end
                @friends1 = Friend.where(:friend_id => @user)
                @friends1.each do |friend|
                    friend.delete
                end
                @review = Review.where(:user_id => @user)
                @review.each do |review|
                    review.delete
                end
                @library = Store.where(:user_id => @user)
                @library.each do |library|
                    library.delete
                end
                User.delete(@user)
                redirect_to deletingUser_succes_path
            else
                redirect_to deletingUser_error_path
            end
        end
    end

    def deletingUser_success
    end

    def deletingUser_error
    end

    def deleteGameLibrary
    end

    def deletingGameLibrary
        game = params[:game][:title]
        user = params[:user][:name]
        if User.exists?(:username => user) && Game.exists?(:title => game)
            game_id = Game.where(:title => game)[0].id
            user_id = User.where(:username => user)[0].id
            if Mylibrary.exists?(:game_id => game_id,:user_id => user_id)
                library = Mylibrary.where(:game_id => game_id, :user_id => user_id)[0].id
                Mylibrary.delete(library)
                redirect_to deleteGameLibrary_success_path
            else
                redirect_to deleteGameLibrary_error_path
            end
        else
            redirect_to deleteGameLibrary_error_path
        end
    end

    def deleteGameLibrary_success
    end

    def deleteGameLibrary_error
    end

end
