# frozen_string_literal: true

module Netatmo
  module BatteryStatus
    class IndoorBatteryStatus < BatteryStatus
      self.status_values = {
        very_low: 0..4559,
        low: 4560..4919,
        medium: 4920..5279,
        high: 5280..5639,
        full: 5640..5999,
        max: 6000..6000
      }.freeze
    end
  end
end
