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
        if name == name1 && password == password1
            @users = Moviegoer.create(:name => name,:provider => password)
            redirect_to login_path
        else
            redirect_to signup_path
        end
end
def create
    name = params[:user][:name]
    password = params[:user][:password]
    @users = Moviegoer.where(:name => name)
    @pass = Moviegoer.where(:provider => password)
    if Moviegoer.exists?(@users)
        if @users[0].name=='admin' && @pass[0].provider=='69420'
            session[:user_id]= @users[0].id
            redirect_to settings_path
        else
            session[:user_id]=@users[0].id
            redirect_to movies_path
        end
    else
        redirect_to login_path
    end
end
def destroy
    session.delete(:user_id)
    redirect_to login_path
end
end
