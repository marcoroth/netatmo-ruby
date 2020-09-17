# frozen_string_literal: true

module Netatmo
  module Weather
    class WindGauge < BatteryDevice
      attr_accessor :wind

      # DeviceType: NAModule2
      def initialize(data)
        super(data)

        self.wind = DashboardData::Wind.new(data['dashboard_data'])
      end
    end
  end
end
