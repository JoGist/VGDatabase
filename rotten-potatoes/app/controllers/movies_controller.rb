class MoviesController < ApplicationController
skip_before_action :verify_authenticity_token
    def index
        @movies = Movie.all
	end
    def main
        @movies = Movie.all
        session[:user_id]='0'
    end
    def settings
        @movies = Movie.all
    end

    def delete
        user_id = session[:user_id]
        Moviegoer.delete(user_id)
        session.delete[:user_id]
        redirect_to login_path
    end

    def deleteAll
        @movies = Movie.all
        @movies.each do |movie|
            movie.destroy
        end
    end

    def searching
        name = params[:movie][:title]
        @movies = Movie.where(:title => name)
        if @movies.length>0
            @movies = @movies[0].id
            redirect_to movie_path(@movies)
        else
            redirect_to search1_path
        end
	end

    def show
        id = params[:id]
        if Movie.exists?(id)
            @movie = Movie.find(id)
        else
            render html: 'Movie does not exit'
        end
	end

    def show1
        id = params[:id]
        if Movie.exists?(id)
            @movie = Movie.find(id)
        else
            render html: 'Movie does not exit'
        end
	end

	def new

	end

    def create
        @movie = Movie.create!(params[:movie].permit(:title,:rating,:release_date))
        redirect_to movies_path
    end

    def edit
        id = params[:id]
        @movie = Movie.find(id)
	end

	def update
        id = params[:id]
        @movie = Movie.find(id)
        @movie.update_attributes!(params[:movie].permit(:title, :rating, :description, :release_date))
		redirect_to movie_path(@movie)
	end

	def destroy
		id = params[:id]
		@movie = Movie.find(id)
		@movie.destroy
		redirect_to movies_path
	end
end
