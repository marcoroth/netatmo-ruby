# frozen_string_literal: true

module Netatmo
  module Weather
    class IndoorModule < BatteryDevice
      attr_accessor :temperature, :co2, :humidity

      # DeviceType: NAModule4
      def initialize(data)
        super(data)

        self.co2 = DashboardData::CO2.new(data['dashboard_data'])
        self.humidity = DashboardData::Humidity.new(data['dashboard_data'])
        self.temperature = DashboardData::Temperature.new(data['dashboard_data'])
      end
    end
  end
end
