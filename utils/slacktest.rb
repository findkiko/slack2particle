#!/usr/bin/env ruby

require 'dotenv'
require 'sinatra'
require 'httparty'
require 'pp'

# Load secrets from local .env file
Dotenv.load(".env.production")

post "/#{ENV['LISTENER_WEBHOOK_ENDPOINT']}" do
  request.body.rewind
  # if params[:token] != ENV['SLACK_SECRET_TOKEN'] # || params[:channel_id] != SEND_CHANNEL_ID
  #   exit
  # end
  #HTTParty.post(ENV['PARTICLE_API_ENDPOINT'], body: {access_token: "#{ENV['PARTICLE_SECRET_TOKEN']}", params: 'on'})
  puts "#{params[:channel_id]}"
end
