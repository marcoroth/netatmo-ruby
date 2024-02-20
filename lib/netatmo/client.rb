# frozen_string_literal: true

require 'faraday'
require 'json'

module Netatmo
  class Client
    BASE_URL = 'https://api.netatmo.net'
    attr_accessor :access_token, :refresh_token, :expires_at

    Config = Struct.new(:client_id, :client_secret, :username, :password, :base_url)

    def initialize(&config_block)
      if block_given?
        config_block.call config
      else
        config
      end

      authenticate
    end

    def configure(&config_block)
      config_block.call config if block_given?
      config
    end

    def config
      @config ||= Config.new(
        ENV.fetch('NETATMO_CLIENT_ID', nil),
        ENV.fetch('NETATMO_CLIENT_SECRET', nil),
        ENV.fetch('NETATMO_USERNAME', nil),
        ENV.fetch('NETATMO_PASSWORD', nil),
        BASE_URL
      )
    end

    def authenticate
      if @access_token && @expires_at > Time.now
        true
      else
        fetch_token
      end
    end

    def fetch_token
      response = if @refresh_token
                   connection.post '/oauth2/token' do |request|
                     request.body = {
                       grant_type: :refresh_token,
                       refresh_token: @refresh_token,
                       client_id: config.client_id,
                       client_secret: config.client_secret
                     }
                   end
                 else
                   connection.post '/oauth2/token' do |request|
                     request.body = {
                       grant_type: :password,
                       client_id: config.client_id,
                       client_secret: config.client_secret,
                       username: config.username,
                       password: config.password,
                       scope: 'read_station'
                     }
                   end
                 end
      store_token(response)
    end

    # rubocop:disable Naming/AccessorMethodName
    def get_station_data
      raise 'Unauthenticated' unless authenticate

      response = connection.get('/api/getstationsdata', access_token: @access_token)

      raise 'Got unsuccessful response' unless response.status == 200

      Netatmo::Weather::StationData.new(JSON.parse(response.body)['body'])
    end
    # rubocop:enable Naming/AccessorMethodName

    private

    def connection
      @connection ||= Faraday::Connection.new(url: config.base_url) do |builder|
        builder.request :url_encoded
        builder.adapter :net_http
      end
    end

    def store_token(response)
      return unless response.status == 200

      data = JSON.parse(response.body)
      @access_token = data['access_token']
      @refresh_token = data['refresh_token']
      @expires_at = Time.now + data['expires_in']
      puts "successfully stored new access_token: #{@access_token} - expires at #{@expires_at}"
    end
  end
end
