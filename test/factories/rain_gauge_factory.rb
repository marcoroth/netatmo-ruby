# frozen_string_literal: true

module Netatmo
  class RainGaugeFactory
    def self.build
      Netatmo::Weather::RainGauge.new(data)
    end

    def self.data
      {
        '_id' => '00:00:00:ff:ff:ff',
        'type' => 'NAModule3',
        'module_name' => 'Regenmodul',
        'data_type' => ['Rain'],
        'last_setup' => 1_451_499_815,
        'reachable' => true,
        'dashboard_data' => {
          'time_utc' => 1_556_667_803,
          'Rain' => 0,
          'sum_rain_24' => 0,
          'sum_rain_1' => 0
        },
        'firmware' => 8,
        'last_message' => 1_556_667_809,
        'last_seen' => 1_556_667_803,
        'rf_status' => 68,
        'battery_vp' => 5514,
        'battery_percent' => 80
      }
    end
  end
end
