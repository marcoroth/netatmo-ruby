# frozen_string_literal: true

require 'test_helper'

module Netatmo
  module DashboardData
    class HealthIndexTest < Minitest::Test
      DASHBOARD_DATA = {
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
      }.freeze

      def test_initialize
        health_index = Netatmo::DashboardData::HealthIndex.new(DASHBOARD_DATA)

        assert_equal 1, health_index.value
        assert_equal 1, health_index.health_index
        assert_equal 1, health_index.health_idx
        assert_equal :fine, health_index.status
        assert_equal Time.at(1_475_506_710), health_index.time
      end

      def test_status
        health_index = Netatmo::DashboardData::HealthIndex.new(DASHBOARD_DATA)

        to_test = {
          -1 => :undefined,
          0 => :healthy,
          1 => :fine,
          2 => :fair,
          3 => :poor,
          4 => :unhealthy,
          5 => :undefined
        }

        to_test.each do |value, status|
          health_index.value = value
          assert_equal status, health_index.status
          assert_equal status == :undefined, health_index.undefined?
          assert_equal status == :healthy, health_index.healthy?
          assert_equal status == :fine, health_index.fine?
          assert_equal status == :fair, health_index.fair?
          assert_equal status == :unhealthy, health_index.unhealthy?
          assert_equal status == :undefined, health_index.undefined?
        end
      end
    end
  end
end
