# frozen_string_literal: true

module Netatmo
  module Weather
    class BatteryDevice < Device
      attr_accessor :battery_vp, :battery_percent, :battery_status

      def initialize(data)
        super(data)
        self.battery_vp = data['battery_vp']
        self.battery_percent = data['battery_percent']
        if type.indoor_module?
          self.battery_status = BatteryStatus::IndoorBatteryStatus.new(battery_vp)
        elsif type.outdoor_module? || type.rain_gauge?
          self.battery_status = BatteryStatus::OutdoorBatteryStatus.new(battery_vp)
        elsif type.wind_gauge?
          self.battery_status = BatteryStatus::WindGaugeBatteryStatus.new(battery_vp)
        end
      end
    end
  end
end
