# frozen_string_literal: true

module Netatmo
  module Weather
    class OutdoorModule < BatteryDevice
      attr_accessor :temperature, :humidity, :pressure

      # DeviceType: NAModule1
      def initialize(data)
        super(data)

        self.humidity = DashboardData::Humidity.new(data['dashboard_data'])
        self.temperature = DashboardData::Temperature.new(data['dashboard_data'])
        self.pressure = DashboardData::Pressure.new(data['dashboard_data']) if pressure?
      end
    end
  end
end
