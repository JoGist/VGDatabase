class SessionsController < ApplicationController
    skip_before_action :set_current_user
def login
end
def signup
end
def signin
        name = params[:user][:name]
        password = params[:user][:password]
        name1 = params[:user][:name1]
        password1 = params[:user][:password1]
        if User.exists?(:email => name)         # Vede se esiste già la mail
            redirect_to signup_error_mail_path
        elsif name1 == 'admin'                  # Non può creare un nuovo admin
            redirect_to signup_error_username_path
        elsif User.exists?(:username => name1)  # Username già esistente
            redirect_to signup_error_username_path
        elsif password != password1             # Password non coincidono    
            redirect_to signup_error_password_path
        else                                    # Controlli a buon fine
            @users = User.create(:email => name, :password => password, :username => name1, :avatar => 'Avatars/avatar_0')
            redirect_to login_path
        end
end
def create
    name = params[:user][:name]
    username = params[:user][:name1]
    password = params[:user][:password]
    if User.exists?(User.where(:username => name))
        @users = User.where(:username => name)[0]
        if name == 'admin' && @users.username == name && @users.password == password
            session[:user_id]= @users.id
            redirect_to settings_path
        elsif @users.username == name && @users.password == password
            session[:user_id]=@users.id
            redirect_to homepage_path
        else
            redirect_to login_error_path
        end
    else
        redirect_to login_error_path
    end
end

def login_error
end

def signup_error_mail
end

def signup_error_username
end

def signup_error_password
end

def forgot_password
end

def forgot_password_error
end

def forgot_password_error_password
end

def change_password
    email = params[:user][:name]
    password = params[:user][:password]
    username = params[:user][:name1]
    password1 = params[:user][:password1]
    if (!User.exists?(:email => email) || !User.exists?(:username => username))
        redirect_to forgot_password_error_path
    elsif password != password1             # Password non coincidono    
        redirect_to forgot_password_error_password_path
    else                                    # Controlli a buon fine
        @user = User.where(:email => email)[0]
        @user.update_attributes!(params[:user].permit(:password))
        redirect_to login_path
    end
end

def homepageGuest
    @games = Game.all
end

def contactUsGuest
end

def searchGuestUser
end

def searchingGuestUser
    user = params[:username]
    if User.exists?(User.where(:username => user))
        @users = User.where(:username => user)[0].id
        redirect_to visit_profile_path(@users)
    else
        render html: 'user non trovato'
    end
end

def searchGuestGame
    @games = Game.all
end

def searchResult
    search = params[:search]
    genre = params[:game][:genre]
    if genre == 'Genre'
        api_endpoint = 'https://api-v3.igdb.com/games'
        request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
        api = Apicalypse.new(api_endpoint, request_headers)
        api.fields(:cover,:genres,:name,:platforms).search(search).limit(10).request
        @result = api.request
    elsif genre == 'Adventure'  
        api_endpoint = 'https://api-v3.igdb.com/games'
        request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
        api = Apicalypse.new(api_endpoint, request_headers)
        api.fields(:cover,:genres,:name,:platforms).search(search).limit(10).request
        @games = api.request
        @result = []
        @games.each do |game|
            if game.keys.include?('cover') && game.keys.include?('genres') && game.keys.include?('platforms')
                if game.values[2].include?(31)
                    @result.push(game)
                end
            end
        end
    elsif genre == 'Racing'  
        api_endpoint = 'https://api-v3.igdb.com/games'
        request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
        api = Apicalypse.new(api_endpoint, request_headers)
        api.fields(:cover,:genres,:name,:platforms).search(search).limit(10).request
        @games = api.request
        @result = []
        @games.each do |game|
            if game.keys.include?('cover') && game.keys.include?('genres') && game.keys.include?('platforms')
                if game.values[2].include?(10)
                    @result.push(game)
                end
            end
        end
    elsif genre == 'Arcade'  
        api_endpoint = 'https://api-v3.igdb.com/games'
        request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
        api = Apicalypse.new(api_endpoint, request_headers)
        api.fields(:cover,:genres,:name,:platforms).search(search).limit(10).request   
        @games = api.request 
        @result = []
        @games.each do |game|
            if game.keys.include?('cover') && game.keys.include?('genres') && game.keys.include?('platforms')
                if game.values[2].include?(33)
                    @result.push(game)
                end
            end
        end
    end
end
            

def destroy
    session.delete(:user_id)
    redirect_to login_path
end

end
