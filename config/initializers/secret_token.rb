# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.jopin('.secret')
  if File.exist?(token_file)
    # Use the existing token
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end 
end

SampleApp::Application.config.secret_key_base = secure_token

#SampleApp::Application.config.secret_key_base = '8e0a5f37d88b2eee4d34ee3cf908b6a81c81be663ba91378175167810425f2ba45ab3b0bc85c6bb0a50364ab53371a48e0c7c2ae5797f9211bbe5c39d439d7cf'
