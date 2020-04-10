# frozen_string_literal: true

module Netatmo
  module Weather
    class BaseStation < Device
      attr_accessor :cipher_id
      attr_accessor :date_setup
      attr_accessor :last_status_store
      attr_accessor :last_upgrade
      attr_accessor :co2_calibrating
      attr_accessor :station_name
      attr_accessor :friend_users
      attr_accessor :read_only

      attr_accessor :temperature
      attr_accessor :co2
      attr_accessor :humidity
      attr_accessor :noise
      attr_accessor :pressure

      attr_accessor :wifi_status
      attr_accessor :place

      attr_accessor :modules

      # DeviceType: NAMain
      def initialize(data)
        super(data)

        self.cipher_id = data['cipher_id']
        self.date_setup = Time.at(data['date_setup']) if data['date_setup']
        self.last_status_store = Time.at(data['last_status_store']) if data['last_status_store']
        self.last_upgrade = Time.at(data['last_upgrade']) if data['last_upgrade']
        self.co2_calibrating = data['co2_calibrating']
        self.station_name = data['station_name']
        self.friend_users = data['friend_users']
        self.read_only = data['read_only']

        self.modules = []

        data['modules']&.each do |module_data|
          modules << Device.parse(module_data)
        end

        if data['dashboard_data']
          self.co2 = DashboardData::CO2.new(data['dashboard_data'])
          self.humidity = DashboardData::Humidity.new(data['dashboard_data'])
          self.temperature = DashboardData::Temperature.new(data['dashboard_data'])
          self.noise = DashboardData::Temperature.new(data['dashboard_data'])
          self.pressure = DashboardData::Pressure.new(data['dashboard_data']) if pressure?
        end
        self.wifi_status = WifiStatus.new(data['wifi_status'])
        self.place = Netatmo::Place.new(data['place'])
      end

      def name
        station_name
      end

      def outdoor_module
        modules.find(&:outdoor_module?)
      end

      def rain_gauge
        modules.find(&:rain_gauge?)
      end

      def wind_gauge
        modules.find(&:wind_gauge?)
      end

      def health_coach
        modules.find(&:health_coach?)
      end

      def indoor_modules
        modules.select(&:indoor_module?)
      end

      def first_indoor_module
        indoor_modules&.first
      end
    end
  end
end
