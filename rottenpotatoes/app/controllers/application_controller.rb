class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user

  def set_current_user
    if not session[:user_id]
        redirect_to login_path
    end
  end
end
