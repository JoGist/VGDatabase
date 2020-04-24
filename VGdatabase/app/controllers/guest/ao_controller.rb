module Guest
    class AoController < ApplicationController
        skip_before_action :set_current_user

        def show
            id = params[:id]
            @game = Game.find(id)
            @review = Review.where(:game_id => @games)
        end
    end
end