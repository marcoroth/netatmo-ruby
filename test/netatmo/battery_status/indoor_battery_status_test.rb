# frozen_string_literal: true

require 'test_helper'

module Netatmo
  module BatteryStatus
    class IndoorBatteryStatusTest < Minitest::Test
      def test_indoor_module
        to_test = {
          -1 => nil,
          0 => :very_low,
          4559 => :very_low,
          4560 => :low,
          4919 => :low,
          4920 => :medium,
          5279 => :medium,
          5280 => :high,
          5639 => :high,
          5640 => :full,
          5999 => :full,
          6000 => :max,
          6001 => nil
        }

        to_test.each do |value, status|
          s = Netatmo::BatteryStatus::IndoorBatteryStatus.new(value)
          assert_equal status, s.status&.key
          assert_equal value, s.value
        end
      end
    end
  end
end
