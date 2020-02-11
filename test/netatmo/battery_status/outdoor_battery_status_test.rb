# frozen_string_literal: true

require 'test_helper'

module Netatmo
  module BatteryStatus
    class OutdoorBatteryStatusTest < Minitest::Test
      def test_outdoor_module
        to_test = {
          0 => :very_low,
          3999 => :very_low,
          4000 => :low,
          4499 => :low,
          4500 => :medium,
          4999 => :medium,
          5000 => :high,
          5499 => :high,
          5500 => :full,
          5999 => :full,
          6000 => :max
        }

        to_test.each do |value, status|
          s = Netatmo::BatteryStatus::OutdoorBatteryStatus.new(value)
          assert_equal status, s.status&.key
          assert_equal value, s.value
        end

        s = Netatmo::BatteryStatus::OutdoorBatteryStatus.new(-1)
        assert_nil s.status&.key
        assert_equal(-1, s.value)

        s = Netatmo::BatteryStatus::OutdoorBatteryStatus.new(6001)
        assert_nil s.status&.key
        assert_equal 6001, s.value
      end
    end
  end
end
