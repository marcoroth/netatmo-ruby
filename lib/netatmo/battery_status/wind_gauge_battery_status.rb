# frozen_string_literal: true

module Netatmo
  module BatteryStatus
    class WindGaugeBatteryStatus < BatteryStatus
      self.status_values = {
        very_low: 0..4359,
        low: 4360..4769,
        medium: 4770..5179,
        high: 5180..5589,
        full: 5590..5999,
        max: 6000..6000
      }.freeze
    end
  end
end
