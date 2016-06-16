#!/usr/bin/env ruby

require 'sinatra'

post "/" do
  request.body.rewind
  params.each do |key, value|
    puts "#{key}: #{value}"
  end
end
