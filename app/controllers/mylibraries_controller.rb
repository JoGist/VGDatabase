class MylibrariesController < ApplicationController
    skip_before_action :verify_authenticity_token
    require 'apicalypse'
    require 'rubygems'
    def create
        game_id = params[:game_id]
        user_id = session[:user_id]
        if Game.exists?(:id => game_id)
            @games = Game.find(game_id)
            @user = User.find(session[:user_id])
            @mylibrary = Mylibrary.new(:favorite => 'false')
            @mylibrary.user_id = @user.id
            @mylibrary.game_id = @games.id
            @mylibrary.save!
            redirect_to myLibrary_path
        else  
            api_endpoint = 'https://api-v3.igdb.com/games'
            request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
            api = Apicalypse.new(api_endpoint, request_headers)
            api.fields(:cover,:genres,:name,:platforms,:release_dates).where(:id => game_id).request
            games = api.request[0]
            
            api_endpoint = 'https://api-v3.igdb.com/covers'
            request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
            api = Apicalypse.new(api_endpoint, request_headers)
            cover = api.fields(:url).where(:id => games.values[1]).request[0].values[1]
            split = cover.split('thumb')[0]+'cover_big'+cover.split('thumb')[1]
  
            api_endpoint = 'https://api-v3.igdb.com/genres'
            request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
            api = Apicalypse.new(api_endpoint, request_headers)
            genres = api.fields(:name).where(:id => games.values[2][0]).request[0].values[1]
            
            api_endpoint = 'https://api-v3.igdb.com/platforms'
            request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
            api = Apicalypse.new(api_endpoint, request_headers)
            platform = api.fields(:name).where(:id => games.values[4][0]).request[0].values[1]

            api_endpoint = 'https://api-v3.igdb.com/release_dates'
            request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }
            api = Apicalypse.new(api_endpoint, request_headers)
            date = api.fields(:human).where(:game => games.values[0] , :platform => games.values[4][0]).request[0].values[1]
            
            Game.create(:serial => game_id, :platform => platform, :genre => genres, :cover => split, :title => games.values[3], :release_date => date)
            @games = Game.where(:serial => game_id)[0].id
            @user = User.find(session[:user_id])
            @mylibrary = Mylibrary.new(:favorite => 'false')
            @mylibrary.user_id = @user.id
            @mylibrary.game_id = @games
            @mylibrary.save!
            redirect_to myLibrary_path
        end
    end

    def destroy
        id = params[:id]
		@mygame = Mylibrary.find(id)
        @mygame.destroy
        redirect_to editLibrary_path
    end

    def update
        id = params[:id]
        @mygame = Mylibrary.find(id)
        if @mygame.favorite == "false"
            @mygame.update_attributes!(:favorite => "true")
            redirect_to myLibraryFavorites_path
        else
            @mygame.update_attributes!(:favorite => "false")   
            redirect_to myLibraryFavorites_path
        end
    end
end