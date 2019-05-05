# frozen_string_literal: true

module Netatmo
  class OutdoorModuleFactory
    def self.build
      Netatmo::Weather::OutdoorModule.new(data)
    end

    def self.data
      {
        '_id' => '00:00:00:ff:ff:ff',
        'type' => 'NAModule1',
        'module_name' => 'Module',
        'data_type' => %w[Temperature Humidity],
        'last_setup' => 1_419_454_648,
        'reachable' => true,
        'dashboard_data' => {
          'time_utc' => 1_556_667_771,
          'Temperature' => 9.6,
          'Humidity' => 71,
          'min_temp' => 9.6,
          'max_temp' => 10.5,
          'date_min_temp' => 1_556_667_463,
          'date_max_temp' => 1_556_661_773,
          'temp_trend' => 'down'
        },
        'firmware' => 44,
        'last_message' => 1_556_667_809,
        'last_seen' => 1_556_667_771,
        'rf_status' => 72,
        'battery_vp' => 5904,
        'battery_percent' => 96
      }
    end
  end
end
