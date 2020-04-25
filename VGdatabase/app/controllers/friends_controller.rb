class FriendsController < ApplicationController
    skip_before_action :set_current_user
    def update
        friend_id = params[:id]
        user_id = session[:user_id]
        @friend = Friend.new(:friend_id => friend_id, :favorite => 'false')
        @friend.user_id = user_id
        @friend.save!
        render html: ''
    end

end

