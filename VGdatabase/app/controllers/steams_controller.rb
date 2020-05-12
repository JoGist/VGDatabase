class SteamsController < ApplicationController
    skip_before_action :set_current_user
    skip_before_action :verify_authenticity_token, :only => :auth_callback

    def auth_callback
      auth = request.env['omniauth.auth']
      if !User.exists?(:id => auth.uid)
        User.create(:username => auth.info['nickname'],:avatar => auth.info['image'],:id => auth.uid)
        session[:user_id] = {:id => auth.uid}.values[0]
        redirect_to editProfile_path
      else
        session[:user_id] = {:id => auth.uid}.values[0]
        redirect_to homepage_path  
      end
    end
  end