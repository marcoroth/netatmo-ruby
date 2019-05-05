# frozen_string_literal: true

require 'test_helper'

module Netatmo
  module DashboardData
    class TemperatureTest < Minitest::Test
      DASHBOARD_DATA = {
        'time_utc' => 1_556_667_796,
        'Temperature' => 22.9,
        'CO2' => 1478,
        'Humidity' => 45,
        'min_temp' => 22.9,
        'max_temp' => 23,
        'date_min_temp' => 1_556_664_773,
        'date_max_temp' => 1_556_661_748,
        'temp_trend' => 'stable'
      }.freeze

      def test_initialize
        temperature = Netatmo::DashboardData::Temperature.new(DASHBOARD_DATA)

        assert_equal 22.9, temperature.value
        assert_equal 22.9, temperature.min
        assert_equal 23.0, temperature.max
        assert_equal Time.at(1_556_664_773), temperature.min_date
        assert_equal Time.at(1_556_661_748), temperature.max_date
        assert_equal Safe::TempTrend, temperature.trend.class
        assert_equal 0, temperature.trend.value
        assert_equal :stable, temperature.trend.key
        assert_equal Time.at(1_556_667_796), temperature.time
      end
    end
  end
end
