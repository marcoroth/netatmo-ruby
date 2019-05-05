# frozen_string_literal: true

module Netatmo
  class WindGaugeFactory
    def self.build
      Netatmo::Weather::WindGauge.new(data)
    end

    def self.data
      {
        '_id' => '00:00:00:ff:ff:ff',
        'type' => 'NAModule2',
        'module_name' => 'Windmodul',
        'data_type' => ['Wind'],
        'last_setup' => 1_451_498_415,
        'reachable' => true,
        'dashboard_data' => {
          'time_utc' => 1_556_667_803,
          'WindStrength' => 1,
          'WindAngle' => 315,
          'GustStrength' => 2,
          'GustAngle' => 325,
          'max_wind_str' => 3,
          'max_wind_angle' => 295,
          'date_max_wind_str' => 1_556_666_598
        },
        'firmware' => 18,
        'last_message' => 1_556_667_809,
        'last_seen' => 1_556_667_809,
        'rf_status' => 80,
        'battery_vp' => 5380,
        'battery_percent' => 70
      }
    end
  end
end
