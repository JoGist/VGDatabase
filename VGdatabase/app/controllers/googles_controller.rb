class GooglesController < ApplicationController
    skip_before_action :set_current_user
    skip_before_action :verify_authenticity_token, :only => :auth_callback

    def googleAuth
        auth = request.env["omniauth.auth"]
        info = auth.info
        if !User.exists?(:id => auth.uid)
            User.create(:username => info.name ,:avatar => info.image, :id => auth.uid)
            session[:user_id] = {:id => auth.uid}.values[0]
            redirect_to editProfile_path
        else
            session[:user_id] = {:id => auth.uid}.values[0]
            redirect_to homepage_path  
         end
    end
end