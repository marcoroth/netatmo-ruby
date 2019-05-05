# frozen_string_literal: true

require 'test_helper'

module Netatmo
  module DashboardData
    class CO2Test < Minitest::Test
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
        co2 = Netatmo::DashboardData::CO2.new(DASHBOARD_DATA)

        assert_equal 1478, co2.value
        assert_equal 'ppm', co2.unit
        assert_equal Time.at(1_556_667_796), co2.time
      end
    end
  end
end
