class GooglesController < ApplicationController
    skip_before_action :set_current_user
    skip_before_action :verify_authenticity_token, :only => :auth_callback

    def googleAuth
        auth = request.env['omniauth.auth']
        info = auth.info
        if session[:user_id]==nil
            if !User.exists?(:google_token => auth.uid)
                User.create(:username => info.name ,:google_username => info.name , :avatar => info.image, :google_token => auth.uid, :email => info.email)
                session[:user_id] = User.where(:google_token => auth.uid)[0].id
                redirect_to editProfileOauth_path
            else
                session[:user_id] = User.where(:google_token => auth.uid)[0].id
                redirect_to homepage_path  
            end
        else
            if !User.exists?(:google_token => auth.uid)
                User.find(session[:user_id]).update_attributes(:google_username => info.name,:google_token => auth.uid)
                redirect_to editProfile_success_path
            else
                redirect_to editProfile_error_path 
            end
        end
    end
end