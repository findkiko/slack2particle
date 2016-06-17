#!/usr/bin/env ruby

require 'sinatra'

class PostDump < Sinatra::Base
  post "/" do
    request.body.rewind
    params.each do |key, value|
      puts "#{key}: #{value}"
    end
  end
end
