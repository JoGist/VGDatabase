class ReviewsController < ApplicationController
    skip_before_action :verify_authenticity_token
def new
    game = params[:game_id]
    @games = Game.find(game)
end

def create
    game_id = params[:game_id]
    user_id = session[:user_id]
    score = params[:review][:score]
    comments = params[:review][:comments]
    @user = User.find(user_id)
    @game = Game.find(game_id)
    @review = Review.new(:score => score,:comments => comments)
    @review.user_id = @user.id
    @review.game_id = @game.id
    @review.save!
    redirect_to game_path(@game)
end
    def index
        movie_id = params[:movie_id]
        user_id = session[:user_id]
        @reviews = Review.where(:movie_id => movie_id)
        @movie = Movie.find(movie_id)
    end

    def index1
        user_id = session[:user_id]
        @user = Moviegoer.find(user_id)
        @reviews = Review.where(:moviegoer_id => user_id)
    end

    def edit
        id = params[:id]
        movie_id = params[:movie_id]
        @reviews = Review.find(id)
        @movie = Movie.find(movie_id)
	end

	def update
        id = params[:id]
        @reviews = Review.find(id)
        @reviews.update_attributes!(params[:review].permit(:potatoes, :comments))
        redirect_to index_path
	end

    def destroy
		id = params[:id]
		@reviews = Review.find(id)
		@reviews.destroy
	end
end
