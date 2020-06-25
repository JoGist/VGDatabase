module Guest
    class ShowController < ApplicationController
        skip_before_action :set_current_user

        def show
            id = params[:id]
            @game = Game.find(id)
            @review = Review.where(:game_id => @game)
            api_endpoint = 'https://api-v3.igdb.com/games'
            request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
            api = Apicalypse.new(api_endpoint, request_headers)
            api.fields(:summary).where(:id => @game.serial).request
            @plot = api.request[0].values[1]
        end
    end
end
