require 'httparty'
require 'base64'
require 'dotenv'

Dotenv.load

def encoding(key)
  url = 'https://accounts.spotify.com/api/token'
  ma_requete_post = HTTParty.post(
    url, 
    headers: {Authorization: key}, 
    body: {grant_type: 'client_credentials'}
  )
  return ma_requete_post
end


def base()
  key = String.new
  key = "#{ENV['SPOTIFY_CLIENT_ID']}:#{ENV['SPOTIFY_CLIENT_SECRET']}"
  key = Base64.strict_encode64(key)
  return key = 'Basic ' + key
end

def recup(token)
  access_token = token['access_token']
  puts access_token
end

key = base
token = encoding(key)
recup(token)
