module Visit
    class ProfileController < ApplicationController
        skip_before_action :set_current_user

        def show
            id = params[:id]
            @user = User.find(id)
            @users = session[:user_id]
            @review = Review.where(:user_id => @user)
            @library = Mylibrary.where(:user_id => @user)
            @friends = Friend.where(:user_id => @user.id,:favorite => 'true')
            @friends1 = Friend.where(:user_id => @user.id,:favorite => 'false')
        end
    end
end