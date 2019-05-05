# frozen_string_literal: true

require 'test_helper'

module Netatmo
  module BatteryStatus
    class BatteryStatusTest < Minitest::Test
      def test_initialize
        values = [-1, 0, 1, 100]

        values.each do |value|
          s = Netatmo::BatteryStatus::BatteryStatus.new(value)
          assert_equal value, s.value
          assert_nil s.status
        end
      end
    end
  end
end
