# frozen_string_literal: true

require 'test_helper'

module Netatmo
  module Weather
    class IndoorModuletest < Minitest::Test
      INDOOR_MODULE = {
        '_id' => '00:00:00:ff:ff:ff',
        'type' => 'NAModule4',
        'module_name' => 'Indoor Module',
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
      }.freeze

      def test_initialize
        indoor_module = Netatmo::Weather::IndoorModule.new(INDOOR_MODULE)

        assert_equal '00:00:00:ff:ff:ff', indoor_module.id
        assert_equal 'NAModule4', indoor_module.code
        assert_equal 'Indoor Module', indoor_module.module_name
        assert_equal %w[Temperature CO2 Humidity], indoor_module.data_types
        assert_equal true, indoor_module.reachable
        assert_equal 44, indoor_module.firmware
        assert_equal Time.at(1_476_296_132), indoor_module.last_setup
        assert_equal Time.at(1_556_667_809), indoor_module.last_message
        assert_equal 86, indoor_module.rf_status
        assert_equal 5166, indoor_module.battery_vp
        assert_equal 54, indoor_module.battery_percent

        refute_nil indoor_module.battery_status
        refute_nil indoor_module.temperature
        refute_nil indoor_module.co2
        refute_nil indoor_module.humidity

        assert_equal true, indoor_module.battery?
        assert_equal true, indoor_module.temperature?
        assert_equal true, indoor_module.co2?
        assert_equal true, indoor_module.humidity?
        assert_equal false, indoor_module.noise?
        assert_equal false, indoor_module.pressure?
        assert_equal false, indoor_module.wind?
        assert_equal false, indoor_module.rain?

        assert_equal indoor_module.data_types.count, 3
        assert_equal indoor_module.data.count, 3
      end
    end
  end
end
