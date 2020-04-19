class SessionsController < ApplicationController
    skip_before_action :set_current_user
def login
end
def signup
end
def signing
        name = params[:user][:name]
        password = params[:user][:password]
        name1 = params[:user][:name1]
        password1 = params[:user][:password1]
        if password == password1
            @users = User.create(:email => name, :password => password, :username => name1)
            redirect_to login_path
        else
            redirect_to signup_path
        end
end
def create
    name = params[:user][:name]
    password = params[:user][:password]
    @users = User.where(:username => name)
    @pass = User.where(:password => password)
    if User.exists?(@users)
        if @users[0].username=='admin@admin' && @pass[0].password == '69420'
            session[:user_id]= @users[0].id
            redirect_to settings_path
        else
            session[:user_id]=@users[0].id
            redirect_to homepage_path
        end
    else
        redirect_to login_path
    end
end

def homepageGuest
    session[:user_id]='0'
end

def contactUs
end
def destroy
    session.delete(:user_id)
    redirect_to login_path
end
end
