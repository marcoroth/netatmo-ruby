# frozen_string_literal: true

require 'test_helper'

module Netatmo
  module Weather
    class BaseStationTest < Minitest::Test
      BASE_STATION = {
        "_id" => "00:00:00:ff:ff:ff",
        "station_name" => "My Weather Station",
        "date_setup" => 1419454648,
        "last_setup" => 1419454648,
        "type" => "NAMain",
        "last_status_store" => 1600379497,
        "module_name" => "Station",
        "firmware" => 177,
        "last_upgrade" => 1439985104,
        "wifi_status" => 60,
        "reachable" => true,
        "co2_calibrating" => false,
        "data_type" => [
          "Temperature",
          "CO2",
          "Humidity",
          "Noise",
          "Pressure"
        ],
        "place" => {
          "altitude" => 300,
          "city" => "Basel",
          "country" => "CH",
          "timezone" => "Europe/Zurich",
          "location" => [
            7.5885761,
            47.5595986
          ]
        },
        "read_only" => true,
        "dashboard_data" => {
          "time_utc" => 1600379486,
          "Temperature" => 25.3,
          "CO2" => 1072,
          "Humidity" => 63,
          "Noise" => 36,
          "Pressure" => 1016.1,
          "AbsolutePressure" => 980.5,
          "min_temp" => 21.3,
          "max_temp" => 25.5,
          "date_max_temp" => 1600293695,
          "date_min_temp" => 1600323910,
          "temp_trend" => "stable",
          "pressure_trend" => "stable"
        },
        "modules" => [
          {
            "_id" => "01:00:00:ff:ff:ff",
            "type" => "NAModule1",
            "module_name" => "Module",
            "last_setup" => 1419454648,
            "data_type" => [
              "Temperature",
              "Humidity"
            ],
            "battery_percent" => 100,
            "reachable" => true,
            "firmware" => 50,
            "last_message" => 1600379496,
            "last_seen" => 1600379483,
            "rf_status" => 76,
            "battery_vp" => 5988,
            "dashboard_data" => {
              "time_utc" => 1600379483,
              "Temperature" => 21.2,
              "Humidity" => 64,
              "min_temp" => 18.8,
              "max_temp" => 34.8,
              "date_max_temp" => 1600338064,
              "date_min_temp" => 1600319969,
              "temp_trend" => "stable"
            }
          },
          {
            "_id" => "02:00:00:ff:ff:ff",
            "type" => "NAModule2",
            "module_name" => "Wind Module",
            "last_setup" => 1451498415,
            "data_type" => [
              "Wind"
            ],
            "battery_percent" => 70,
            "reachable" => true,
            "firmware" => 25,
            "last_message" => 1600379496,
            "last_seen" => 1600379496,
            "rf_status" => 81,
            "battery_vp" => 5391,
            "dashboard_data" => {
              "time_utc" => 1600379483,
              "WindStrength" => 1,
              "WindAngle" => 45,
              "GustStrength" => 3,
              "GustAngle" => 45,
              "max_wind_str" => 12,
              "max_wind_angle" => 357,
              "date_max_wind_str" => 1600346868
            }
          },
          {
            "_id" => "03:00:00:ff:ff:ff",
            "type" => "NAModule4",
            "module_name" => "Indoor Module",
            "last_setup" => 1476296132,
            "data_type" => [
              "Temperature",
              "CO2",
              "Humidity"
            ],
            "battery_percent" => 95,
            "reachable" => true,
            "firmware" => 50,
            "last_message" => 1600379496,
            "last_seen" => 1600379471,
            "rf_status" => 73,
            "battery_vp" => 5909,
            "dashboard_data" => {
              "time_utc" => 1600379471,
              "Temperature" => 25.3,
              "CO2" => 901,
              "Humidity" => 58,
              "min_temp" => 24.2,
              "max_temp" => 25.7,
              "date_max_temp" => 1600357120,
              "date_min_temp" => 1600322059,
              "temp_trend" => "stable"
            }
          },
          {
            "_id" => "05:00:00:ff:ff:ff",
            "type" => "NAModule3",
            "module_name" => "Rain Module",
            "last_setup" => 1560014014,
            "data_type" => [
              "Rain"
            ],
            "battery_percent" => 83,
            "reachable" => false,
            "firmware" => 12,
            "last_message" => 1600378753,
            "last_seen" => 1600376721,
            "rf_status" => 96,
            "battery_vp" => 5622
          }
        ]
      }.freeze

      def test_initialize
        base_station = Netatmo::Weather::BaseStation.new(BASE_STATION)

        assert_equal '00:00:00:ff:ff:ff', base_station.id
        assert_equal 'NAMain', base_station.code
        assert_equal 'Station', base_station.module_name
        assert_equal %w[Temperature CO2 Humidity Noise Pressure], base_station.data_types
        assert_equal true, base_station.reachable
        assert_equal 177, base_station.firmware
        assert_equal Time.at(1419454648), base_station.last_setup

        refute_nil base_station.temperature
        refute_nil base_station.co2
        refute_nil base_station.humidity
        refute_nil base_station.noise
        refute_nil base_station.pressure

        refute_nil base_station.temperature.value
        refute_nil base_station.co2.value
        refute_nil base_station.humidity.value
        refute_nil base_station.noise.value
        refute_nil base_station.pressure.value

        assert_equal Netatmo::DashboardData::Temperature, base_station.temperature.class
        assert_equal Netatmo::DashboardData::CO2, base_station.co2.class
        assert_equal Netatmo::DashboardData::Humidity, base_station.humidity.class
        assert_equal Netatmo::DashboardData::Noise, base_station.noise.class
        assert_equal Netatmo::DashboardData::Pressure, base_station.pressure.class

        assert_equal true, base_station.temperature?
        assert_equal true, base_station.co2?
        assert_equal true, base_station.humidity?
        assert_equal true, base_station.noise?
        assert_equal true, base_station.pressure?
        assert_equal false, base_station.wind?
        assert_equal false, base_station.rain?

        assert_equal base_station.data_types.count, 5
        assert_equal base_station.data.count, 5
      end
    end
  end
end
