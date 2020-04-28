module Guest
    class ShowController < ApplicationController
        skip_before_action :set_current_user

        def show
            id = params[:id]
            @game = Game.find(id)
            @review = Review.where(:game_id => @game)
        end
    end
end