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
end

def get_latest_release(token) 
  requete = HTTParty.get(
    "https://api.spotify.com/v1/browse/new-releases?limit=2",
    @headers = {
      "Content-Type": 'application/json',
      "Accept": 'application/json',
      "Authorization": "Bearer #{token}"
    }
  )
end

key = base
hash_token = encoding(key)
token = recup(hash_token)
puts get_latest_release(token)
