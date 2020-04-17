class GamesController < ApplicationController
skip_before_action :verify_authenticity_token

def index
    @games = Game.all
end
end
