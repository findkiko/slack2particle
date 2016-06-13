#!/usr/bin/env ruby

require 'dotenv'
require 'sinatra'
require 'httparty'

class Slack2Particle < Sinatra::Base
  # Load secrets from local .env file
  Dotenv.load(".env.production")

  post "/#{ENV['LISTENER_WEBHOOK_ENDPOINT']}" do
    request.body.rewind
    if params[:token] != ENV['SLACK_SECRET_TOKEN'] or params[:channel_id] != ENV['SLACK_SEND_CHANNEL_ID']
      exit
    end
    #HTTParty.post(ENV['PARTICLE_API_ENDPOINT'], body: {access_token: "#{ENV['PARTICLE_SECRET_TOKEN']}", params: 'on'})
    puts "#{params[:channel_id]}"
  end
end
