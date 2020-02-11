# frozen_string_literal: true

require 'test_helper'

module Netatmo
  module BatteryStatus
    class WindGaugeBatteryStatusTest < Minitest::Test
      def test_wind_gauge
        to_test = {
          0 => :very_low,
          4359 => :very_low,
          4360 => :low,
          4769 => :low,
          4770 => :medium,
          5179 => :medium,
          5180 => :high,
          5589 => :high,
          5590 => :full,
          5999 => :full,
          6000 => :max
        }

        to_test.each do |value, status|
          s = Netatmo::BatteryStatus::WindGaugeBatteryStatus.new(value)
          assert_equal status, s.status&.key
          assert_equal value, s.value
        end

        s = Netatmo::BatteryStatus::WindGaugeBatteryStatus.new(-1)
        assert_nil s.status&.key
        assert_equal(-1, s.value)

        s = Netatmo::BatteryStatus::WindGaugeBatteryStatus.new(6001)
        assert_nil s.status&.key
        assert_equal 6001, s.value
      end
    end
  end
end
