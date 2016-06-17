#!/usr/bin/env ruby

require 'dotenv'
require 'sinatra'
require 'httparty'

class Slack2Particle < Sinatra::Base
  # Load secrets from local .env file
  Dotenv.load(".env.production")

  post "/#{ENV['LISTENER_WEBHOOK_ENDPOINT']}" do
    request.body.rewind
    if params[:token] != ENV['SLACK_SECRET_TOKEN'] or params[:user_id] != ENV['SLACK_USER_ID']
      '{ "text": "Sorry: User not authorized." }'
      exit
    end
    response = HTTParty.post(ENV['PARTICLE_API_ENDPOINT'], body: {access_token: "#{ENV['PARTICLE_SECRET_TOKEN']}", params: 'on'})
    if response.code == 200
      '{ "text": "The door has been unlocked." }'
    else
      '{ "text": "Error: Particle API request failed." }'
    end
  end
end
