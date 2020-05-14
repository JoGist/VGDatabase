class ReviewsController < ApplicationController
    skip_before_action :verify_authenticity_token
def new
    @user = User.find(session[:user_id])
    game = params[:game_id]
    @games = Game.find(game)
end

def create
    game_id = params[:game_id]
    user_id = session[:user_id]
    score = params[:review][:score]
    comments = params[:review][:comment]
    @user = User.find(user_id)
    @game = Game.find(game_id)
    @review = Review.new(:score => score,:comments => comments)
    @review.user_id = @user.id
    @review.game_id = @game.id
    @review.save!
    redirect_to game_path(@game)
end

def edit
    @user = User.find(session[:user_id])
    id = params[:id]
    game_id = params[:game_id]
    @review = Review.find(Review.where(:user_id => session[:user_id], :game_id => game_id)[0].id)
    @game = Game.find(game_id)
end

def update
    id = params[:id]
    game_id = params[:game_id]
    score = params[:review][:score]
    comments = params[:review][:comment]
    @reviews = Review.find(id)
    @reviews.update_attributes!(:score => score, :comments => comments)
    redirect_to game_path(game_id)
end

def destroy
    id = params[:id]
    @reviews = Review.find(id)
    @reviews.destroy
    game = params[:game_id]
    redirect_to game_path(game)
end
end
