class ReviewsController < ApplicationController
def new
end
def create
    game_id = params[:movie_id]
    user_id = session[:user_id]
    @movie = Movie.find(movie_id)
    @review = Review.new(params[:review].permit(:potatoes,:comments))
    @review.moviegoer_id = user_id
    @review.movie_id = movie_id
    @review.save!
    redirect_to movie_path(@movie)
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
