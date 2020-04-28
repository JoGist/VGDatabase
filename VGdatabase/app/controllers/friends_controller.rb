class FriendsController < ApplicationController
    skip_before_action :set_current_user
    def update
        friend_id = params[:id]
        user_id = session[:user_id]
        @friend = Friend.new(:friend_id => friend_id, :favorite => 'false')
        @friend.user_id = user_id
        @friend.save!
        redirect_to visit_profile_path(friend_id)
    end

    def destroy
        id = params[:id]
        friend = Friend.where(:user_id => session[:user_id], :friend_id => id)
        Friend.delete(friend[0].id)
        redirect_to visit_profile_path(id)
    end

    def show
        friend_id = params[:id]
        user_id = session[:user_id]
        @friend = Friend.find(Friend.where(:user_id => user_id, :friend_id => friend_id)[0].id)
        if (@friend.favorite == 'false')
            @friend.update_attributes!(:favorite => 'true')
        else
            @friend.update_attributes!(:favorite => 'false')
        end
        redirect_to friends_path
    end
end

