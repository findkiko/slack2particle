#!/usr/bin/env ruby

require 'dotenv'
require 'httparty'

# Load secrets from local .env file
Dotenv.load(".env.production")

HTTParty.post("http://localhost:3000/#{ENV['LISTENER_WEBHOOK_ENDPOINT']}" \
              , body: {  token: "#{ENV['SLACK_SECRET_TOKEN']}" \
                        ,channel_id:   "#{ENV['SLACK_SEND_CHANNEL_ID']}" \
                      })
