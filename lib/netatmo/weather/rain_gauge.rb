# frozen_string_literal: true

module Netatmo
  module Weather
    class RainGauge < BatteryDevice
      attr_accessor :rain

      # DeviceType: NAModule3
      def initialize(data)
        super(data)
        self.rain = DashboardData::Rain.new(data['dashboard_data'])
      end
    end
  end
end
