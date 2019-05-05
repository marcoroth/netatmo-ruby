# frozen_string_literal: true

module Netatmo
  class IndoorModuleFactory
    def self.build
      Netatmo::Weather::IndoorModule.new(data)
    end

    def self.data
      {
        '_id' => '00:00:00:ff:ff:ff',
        'type' => 'NAModule4',
        'module_name' => 'Innenmodul',
        'data_type' => %w[Temperature CO2 Humidity],
        'last_setup' => 1_476_296_132,
        'reachable' => true,
        'dashboard_data' => {
          'time_utc' => 1_556_667_796,
          'Temperature' => 22.9,
          'CO2' => 1478,
          'Humidity' => 45,
          'min_temp' => 22.9,
          'max_temp' => 23,
          'date_min_temp' => 1_556_664_773,
          'date_max_temp' => 1_556_661_748,
          'temp_trend' => 'stable'
        },
        'firmware' => 44,
        'last_message' => 1_556_667_809,
        'last_seen' => 1_556_667_796,
        'rf_status' => 86,
        'battery_vp' => 5166,
        'battery_percent' => 54
      }
    end
  end
end
