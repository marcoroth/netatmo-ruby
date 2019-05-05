# frozen_string_literal: true

require 'test_helper'

module Netatmo
  module Weather
    class HomeCoachTest < Minitest::Test
      HOME_COACH = {
        '_id' => '70:ee:50:ff:xx:yy',
        'cipher_id' => 'enc:16:z3RGGgPfBY7kwKloZQ5HcZlGin0ifQNUFQtcwnVSyn2YiIQ7NS2SDv//zivyXxYY',
        'last_status_store' => 1_475_506_710,
        'modules' => [],
        'place' => {
          'city' => 'Boulogne-billancourt',
          'country' => 'FR',
          'timezone' => 'Europe/Paris',
          'location' => [2.25, 48.833301544189]
        },
        'type' => 'NHC',
        'dashboard_data' => {
          'time_utc' => 1_475_506_710,
          'health_idx' => 1,
          'Noise' => 39,
          'Temperature' => 25.2,
          'temp_trend' => 'stable',
          'Humidity' => 30,
          'CO2' => 599,
          'date_max_temp' => 1_475_488_860,
          'date_min_temp' => 1_475_501_569,
          'min_temp' => 24.5,
          'max_temp' => 27.1
        },
        'data_type' => %w[Temperature CO2 Humidity Noise health_idx],
        'co2_calibrating' => false,
        'date_setup' => 1_467_208_088,
        'last_setup' => 1_468_335_267,
        'module_name' => 'Indoor',
        'firmware' => 23,
        'last_upgrade' => 1_468_335_268,
        'wifi_status' => 22,
        'name' => 'Office'
      }.freeze

      def test_initialize
        home_coach = Netatmo::AirCare::HomeCoach.new(HOME_COACH)

        assert_equal '70:ee:50:ff:xx:yy', home_coach.id
        assert_equal 'NHC', home_coach.code
        assert_equal 'Indoor', home_coach.module_name
        assert_equal %w[Temperature CO2 Humidity Noise health_idx], home_coach.data_types
        assert_equal 23, home_coach.firmware
        assert_equal Time.at(1_467_208_088), home_coach.date_setup
        assert_equal Time.at(1_468_335_267), home_coach.last_setup
        assert_equal Time.at(1_468_335_268), home_coach.last_upgrade
        assert_equal Time.at(1_475_506_710), home_coach.last_status_store

        refute_nil home_coach.wifi_status
        refute_nil home_coach.health_index
        refute_nil home_coach.temperature
        refute_nil home_coach.co2
        refute_nil home_coach.humidity

        assert_equal true, home_coach.temperature?
        assert_equal true, home_coach.co2?
        assert_equal true, home_coach.humidity?
        assert_equal true, home_coach.noise?
        assert_equal true, home_coach.health_index?
        assert_equal false, home_coach.battery?
        assert_equal false, home_coach.pressure?
        assert_equal false, home_coach.wind?
        assert_equal false, home_coach.rain?

        assert_equal 5, home_coach.data_types.count
        assert_equal 5, home_coach.data.count
      end
    end
  end
end
