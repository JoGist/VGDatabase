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

def searchingGuestGame
    search = params[:search]
    genre = params[:game][:genre]
    platform = params[:game][:platform]
    choice = params[:game][:choice]
    if choice == 'Title'
        if Game.exists?(Game.where(:title => search, :platform => platform, :genre => genre))
            @games = Game.where(:title => search, :platform => platform, :genre => genre)[0].id
            redirect_to show_guest_path
        end
    elsif choice == 'Developer'
       if Game.exists?(Game.where(:developer => search))
             @games = Game.where(:developer => search)
             render html: 'boh'
        end
    end         
end
            

def destroy
    session.delete(:user_id)
    redirect_to login_path
end

def showGuest
end

end
