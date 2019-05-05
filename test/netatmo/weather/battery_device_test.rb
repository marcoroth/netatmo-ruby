# frozen_string_literal: true

require 'test_helper'

module Netatmo
  module Weather
    class BatteryDeviceTest < Minitest::Test
      OUTDOOR_MODULE = {
        '_id' => '02:00:00:05:08:1e',
        'type' => 'NAModule1',
        'module_name' => 'Module',
        'data_type' => %w[Temperature Humidity], 'last_setup' => 1_419_454_648, 'reachable' => true, 'dashboard_data' => {
          'time_utc' => 1_556_667_771, 'Temperature' => 9.6, 'Humidity' => 71, 'min_temp' => 9.6, 'max_temp' => 10.5, 'date_min_temp' => 1_556_667_463,
          'date_max_temp' => 1_556_661_773, 'temp_trend' => 'down'
        },
        'firmware' => 44, 'last_message' => 1_556_667_809, 'last_seen' => 1_556_667_771, 'rf_status' => 72, 'battery_vp' => 5904, 'battery_percent' => 96
      }.freeze

      WIND_GAUGE = {
        '_id' => '06:00:00:00:9a:7a',
        'type' => 'NAModule2',
        'module_name' => 'Windmodul',
        'data_type' => ['Wind'], 'last_setup' => 1_451_498_415, 'reachable' => true, 'dashboard_data' => {
          'time_utc' => 1_556_667_803, 'WindStrength' => 1, 'WindAngle' => 315, 'GustStrength' => 2, 'GustAngle' => 325, 'max_wind_str' => 3, 'max_wind_angle' => 295,
          'date_max_wind_str' => 1_556_666_598
        },
        'firmware' => 18, 'last_message' => 1_556_667_809, 'last_seen' => 1_556_667_809, 'rf_status' => 80, 'battery_vp' => 5380, 'battery_percent' => 70
      }.freeze

      RAIN_GAUGE = {
        '_id' => '05:00:00:00:69:86',
        'type' => 'NAModule3',
        'module_name' => 'Regenmodul',
        'data_type' => ['Rain'], 'last_setup' => 1_451_499_815, 'reachable' => true, 'dashboard_data' => {
          'time_utc' => 1_556_667_803, 'Rain' => 0, 'sum_rain_24' => 0, 'sum_rain_1' => 0
        },
        'firmware' => 8, 'last_message' => 1_556_667_809, 'last_seen' => 1_556_667_803, 'rf_status' => 68, 'battery_vp' => 5514, 'battery_percent' => 80
      }.freeze

      INDOOR_MODULE = {
        '_id' => '03:00:00:03:f1:aa',
        'type' => 'NAModule4',
        'module_name' => 'Innenmodul',
        'data_type' => %w[Temperature CO2 Humidity], 'last_setup' => 1_476_296_132, 'reachable' => true, 'dashboard_data' => {
          'time_utc' => 1_556_667_796, 'Temperature' => 22.9, 'CO2' => 1478, 'Humidity' => 45, 'min_temp' => 22.9, 'max_temp' => 23, 'date_min_temp' => 1_556_664_773,
          'date_max_temp' => 1_556_661_748, 'temp_trend' => 'stable'
        },
        'firmware' => 44, 'last_message' => 1_556_667_809, 'last_seen' => 1_556_667_796, 'rf_status' => 86, 'battery_vp' => 5166, 'battery_percent' => 54
      }.freeze

      def test_outdoor_module
        outdoor_module = Netatmo::Weather::OutdoorModule.new(OUTDOOR_MODULE)

        assert_equal Netatmo::BatteryStatus::OutdoorBatteryStatus, outdoor_module.battery_status.class
        assert_equal OUTDOOR_MODULE['battery_vp'], outdoor_module.battery_status.value
      end

      def test_rain_gauge
        rain_gauge = Netatmo::Weather::RainGauge.new(RAIN_GAUGE)

        assert_equal Netatmo::BatteryStatus::OutdoorBatteryStatus, rain_gauge.battery_status.class
        assert_equal RAIN_GAUGE['battery_vp'], rain_gauge.battery_status.value
      end

      def test_wind_gauge
        wind_gauge = Netatmo::Weather::WindGauge.new(WIND_GAUGE)

        assert_equal Netatmo::BatteryStatus::WindGaugeBatteryStatus, wind_gauge.battery_status.class
        assert_equal WIND_GAUGE['battery_vp'], wind_gauge.battery_status.value
      end

      def test_indoor_module
        indoor_module = Netatmo::Weather::IndoorModule.new(INDOOR_MODULE)

        assert_equal Netatmo::BatteryStatus::IndoorBatteryStatus, indoor_module.battery_status.class
        assert_equal INDOOR_MODULE['battery_vp'], indoor_module.battery_status.value
      end
    end
  end
end
