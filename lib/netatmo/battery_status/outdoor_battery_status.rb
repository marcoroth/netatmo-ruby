# frozen_string_literal: true

module Netatmo
  module BatteryStatus
    class OutdoorBatteryStatus < BatteryStatus
      self.status_values = {
        very_low: 0..3999,
        low: 4000..4499,
        medium: 4500..4999,
        high: 5000..5499,
        full: 5500..5999,
        max: 6000..6000
      }.freeze
    end
  end
end
