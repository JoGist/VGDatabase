class SteamsController < ApplicationController
    skip_before_action :set_current_user
    skip_before_action :verify_authenticity_token, :only => :auth_callback

    def auth_callback
      auth = request.env['omniauth.auth']
      if !User.exists?(:steam_token => auth.uid)
        User.create(:username => auth.info['nickname'],:steam_username => auth.info['nickname'],:avatar => auth.info['image'],:steam_token => auth.uid)
        session[:user_id] = User.where(:steam_token => auth.uid)[0].id
        redirect_to editProfile_path
      else
        session[:user_id] = User.where(:steam_token => auth.uid)[0].id
        redirect_to homepage_path  
      end
    end
  end