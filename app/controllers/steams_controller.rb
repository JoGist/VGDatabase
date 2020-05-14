class SteamsController < ApplicationController
    skip_before_action :set_current_user
    skip_before_action :verify_authenticity_token, :only => :auth_callback

    def auth_callback
      auth = request.env['omniauth.auth']
      if session[:user_id]==nil
        if !User.exists?(:steam_token => auth.uid)
          User.create(:username => auth.info['nickname'],:steam_username => auth.info.values[4].values[0].split('id/')[1].split('/')[0],:avatar => auth.extra.raw_info['avatarfull'],:steam_token => auth.uid)
          session[:user_id] = User.where(:steam_token => auth.uid)[0].id
          redirect_to editProfileOauth_path
        else
          session[:user_id] = User.where(:steam_token => auth.uid)[0].id
          redirect_to homepage_path  
        end
      else
        if !User.exists?(:steam_token => auth.uid)
          User.find(session[:user_id]).update_attributes(:steam_username => auth.info.values[4].values[0].split('id/')[1].split('/')[0],:steam_token => auth.uid)
          redirect_to editProfile_success_path
        else
          redirect_to editProfile_error_path 
        end
      end
    end
end