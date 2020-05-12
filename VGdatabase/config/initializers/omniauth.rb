Rails.application.config.middleware.use OmniAuth::Builder do
    provider :steam, ENV["STEAM_WEB_API_KEY"]
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
  end