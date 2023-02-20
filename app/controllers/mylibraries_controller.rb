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
            redirect_to homepage_path
        else  
            api_endpoint = 'https://api.igdb.com/v4/games'
request_headers = { headers: { 'client-id' => Rails.application.credentials.maps[:igdb], 'authorization' => Rails.application.credentials.maps[:access_token], 'x-user-agent' => 'ruby-apicalypse'} }

            api = Apicalypse.new(api_endpoint, request_headers)
            api.fields(:cover,:genres,:name,:platforms,:release_dates,:involved_companies).where(:id => game_id).request
            games = api.request[0]
            
            api_endpoint = 'https://api.igdb.com/v4/covers'
request_headers = { headers: { 'client-id' => Rails.application.credentials.maps[:igdb], 'authorization' => Rails.application.credentials.maps[:access_token], 'x-user-agent' => 'ruby-apicalypse'} }

            api = Apicalypse.new(api_endpoint, request_headers)
            cover = api.fields(:url).where(:id => games.values[1]).request[0].values[1]
            split = cover.split('thumb')[0]+'cover_big'+cover.split('thumb')[1]
  
            api_endpoint = 'https://api.igdb.com/v4/genres'
request_headers = { headers: { 'client-id' => Rails.application.credentials.maps[:igdb], 'authorization' => Rails.application.credentials.maps[:access_token], 'x-user-agent' => 'ruby-apicalypse'} }

            api = Apicalypse.new(api_endpoint, request_headers)
            genres = api.fields(:name).where(:id => games.values[2][0]).request[0].values[1]
            
            api_endpoint = 'https://api.igdb.com/v4/platforms'
request_headers = { headers: { 'client-id' => Rails.application.credentials.maps[:igdb], 'authorization' => Rails.application.credentials.maps[:access_token], 'x-user-agent' => 'ruby-apicalypse'} }

            api = Apicalypse.new(api_endpoint, request_headers)
            platform = api.fields(:name).where(:id => games.values[5][0]).request[0].values[1]

            api_endpoint = 'https://api.igdb.com/v4/release_dates'
request_headers = { headers: { 'client-id' => Rails.application.credentials.maps[:igdb], 'authorization' => Rails.application.credentials.maps[:access_token], 'x-user-agent' => 'ruby-apicalypse'} }

            api = Apicalypse.new(api_endpoint, request_headers)
            date = api.fields(:human).where(:game => games.values[0] , :platform => games.values[5][0]).request[0].values[1]

            api_endpoint = 'https://api.igdb.com/v4/involved_companies'
request_headers = { headers: { 'client-id' => Rails.application.credentials.maps[:igdb], 'authorization' => Rails.application.credentials.maps[:access_token], 'x-user-agent' => 'ruby-apicalypse'} }

            api = Apicalypse.new(api_endpoint, request_headers)
            api.fields(:company).where(:id => games.values[3][0]).limit(1).request
            involved_companies = api.request[0].values[1]

            api_endpoint = 'https://api.igdb.com/v4/companies'
request_headers = { headers: { 'client-id' => Rails.application.credentials.maps[:igdb], 'authorization' => Rails.application.credentials.maps[:access_token], 'x-user-agent' => 'ruby-apicalypse'} }

            api = Apicalypse.new(api_endpoint, request_headers)
            api.fields(:name).where(:id => involved_companies).limit(1).request
            companies = api.request[0].values[1]
            
            Game.create(:serial => game_id, :platform => platform, :genre => genres, :cover => split, :title => games.values[4], :release_date => date, :developer => companies)
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
            redirect_to myLibrary_path
        else
            @mygame.update_attributes!(:favorite => "false")   
            redirect_to myLibraryFavorites_path
        end
    end
end