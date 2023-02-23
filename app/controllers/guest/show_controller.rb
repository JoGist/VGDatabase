module Guest
    class ShowController < ApplicationController
        skip_before_action :set_current_user

        def show
            id = params[:id]
            @game = Game.find(id)
            @review = Review.where(:game_id => @game)
            api_endpoint = 'https://api.igdb.com/v4/games'
            request_headers = { headers: { 'client-id' => Rails.application.credentials.maps[:igdb], 'authorization' => Rails.application.credentials.maps[:access_token], 'x-user-agent' => 'ruby-apicalypse'} }
            api = Apicalypse.new(api_endpoint, request_headers)
            #api.fields(:summary).where(:id => @game.serial).request
            api.request
            @plot = api.request[0].values[1]
        end
    end
end
