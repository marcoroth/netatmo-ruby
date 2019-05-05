# frozen_string_literal: true

require 'faraday'
require 'json'
require 'byebug'

module Netatmo
  class Client
    def authenticate
      if @access_token && @expires_at > Time.now
        true
      else
        get_token
      end
    end

    def initialize
      authenticate
    end

    def get_token
      response = if @refresh_token
                   connection.post '/oauth2/token' do |request|
                     request.body = {
                       grant_type: :refresh_token,
                       refresh_token: @refresh_token,
                       client_id: ENV['NETATMO_CLIENT_ID'],
                       client_secret: ENV['NETATMO_CLIENT_SECRET']
                     }
                   end
                 else
                   connection.post '/oauth2/token' do |request|
                     request.body = {
                       grant_type: :password,
                       client_id: ENV['NETATMO_CLIENT_ID'],
                       client_secret: ENV['NETATMO_CLIENT_SECRET'],
                       username: ENV['NETATMO_USERNAME'],
                       password: ENV['NETATMO_PASSWORD'],
                       scope: 'read_station'
                     }
                   end
                 end
      puts response.body.inspect
      store_token(response)
    end

    def get_station_data
      response = connection.get '/api/getstationsdata', access_token: @access_token

      if response.status == 200
        Netatmo::Weather::StationData.new(JSON.parse(response.body)['body'])
      else
        raise 'Unauthenticated'
      end
    end

    private

    def connection
      @connection ||= Faraday::Connection.new(url: 'https://api.netatmo.net') do |builder|
        builder.request :url_encoded
        builder.adapter :net_http
      end
    end

    def store_token(response)
      if response.status == 200
        data = JSON.parse(response.body)
        @access_token = data['access_token']
        @refresh_token = data['refresh_token']
        @expires_at = Time.now + data['expires_in']
      end
    end
  end
end
