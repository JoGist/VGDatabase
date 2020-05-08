require 'rubygems'
require 'apicalypse'

api_endpoint = 'https://api-v3.igdb.com/games'
request_headers = { headers: { 'user-key' => Rails.application.credentials.maps[:igdb] } }

api = Apicalypse.new(api_endpoint, request_headers)

api
.fields(:name, :total_rating)
.where(category: 1)
.search('Call of Duty')
.limit(2)
.request
render html: api.request
