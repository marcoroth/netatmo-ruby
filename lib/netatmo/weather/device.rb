# frozen_string_literal: true

require 'forwardable'

module Netatmo
  module Weather
    class Device
      extend Forwardable

      attr_accessor :id
      attr_accessor :type
      attr_accessor :data_types
      attr_accessor :module_name
      attr_accessor :code
      attr_accessor :reachable
      attr_accessor :dashboard_data
      attr_accessor :firmware
      attr_accessor :last_setup
      attr_accessor :last_message
      attr_accessor :last_seen
      attr_accessor :rf_status

      def_delegators :type, :base_station?, :outdoor_module?, :wind_gauge?, :rain_gauge?, :indoor_module?, :health_coach?

      def self.parse(data)
        type = Netatmo::Util::DeviceType.value(data['type'])

        if type.base_station?
          Netatmo::Weather::BaseStation.new(data)
        elsif type.outdoor_module?
          Netatmo::Weather::OutdoorModule.new(data)
        elsif type.wind_gauge?
          Netatmo::Weather::WindGauge.new(data)
        elsif type.rain_gauge?
          Netatmo::Weather::RainGauge.new(data)
        elsif type.indoor_module?
          Netatmo::Weather::IndoorModule.new(data)
        elsif type.home_coach?
          Netatmo::AirCare::HealthCoach.new(data)
        else
          Device.new(data)
        end
      end

      def initialize(data)
        self.id = data['_id']
        self.type = Netatmo::Util::DeviceType.value(data['type'])
        self.code = data['type']
        self.data_types = data['data_type']
        self.module_name = data['module_name']
        self.reachable = data['reachable']
        self.firmware = data['firmware']
        self.last_setup = Time.at(data['last_setup']) if data['last_setup']
        self.last_message = Time.at(data['last_message']) if data['last_message']
        self.last_seen = Time.at(data['last_seen']) if data['last_seen']
        self.rf_status = data['rf_status']
        self.data_types = [] if data_types.nil?
      end

      def name
        module_name
      end

      def co2?
        respond_to?(:co2) && data_types.include?('CO2')
      end

      def humidity?
        respond_to?(:humidity) && data_types.include?('Humidity')
      end

      def noise?
        respond_to?(:noise) && data_types.include?('Noise')
      end

      def temperature?
        respond_to?(:temperature) && data_types.include?('Temperature')
      end

      def pressure?
        respond_to?(:pressure) && data_types.include?('Pressure')
      end

      def rain?
        respond_to?(:rain) && data_types.include?('Rain')
      end

      def wind?
        respond_to?(:wind) && data_types.include?('Wind')
      end

      def health_index?
        respond_to?(:health_index) && data_types.include?('health_idx')
      end

      def battery?
        respond_to?(:battery_status)
      end

      def data
        d = []
        d << co2 if co2?
        d << humidity if humidity?
        d << noise if noise?
        d << temperature if temperature?
        d << pressure if pressure?
        d << wind if wind?
        d << rain if rain?

        d
      end

      def values
        h = {}
        h[:co2] = co2 if co2?
        h[:humidity] = humidity if humidity?
        h[:noise] = noise if noise?
        h[:temperature] = temperature if temperature?
        h[:pressure] = pressure if pressure?
        h[:wind] = wind if wind?
        h[:rain] = rain if rain?

        h
      end
    end
  end
end
