module Visit
    class ProfileController < ApplicationController
        skip_before_action :set_current_user

        def show
            id = params[:id]
            @user = User.find(id)
            @users = session[:user_id]
            @review = Review.where(:user_id => @user)
            @library = Mylibrary.where(:user_id => @user)
            @friends = Friend.where(:user_id => @user)
        end
    end
end