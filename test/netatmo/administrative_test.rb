# frozen_string_literal: true

require 'test_helper'

module Netatmo
  class AdministrativeTest < Minitest::Test
    def test_initialize
      administrative = Netatmo::Administrative.new(USER['administrative'])

      assert_equal Netatmo::Util::Unit, administrative.unit.class
      assert_equal 0, administrative.unit.value
      assert_equal :metric, administrative.unit.key

      assert_equal Netatmo::Util::Windunit, administrative.windunit.class
      assert_equal 0, administrative.windunit.value
      assert_equal :kph, administrative.windunit.key

      assert_equal Netatmo::Util::Pressureunit, administrative.pressureunit.class
      assert_equal 0, administrative.pressureunit.value
      assert_equal :mbar, administrative.pressureunit.key

      assert_equal Netatmo::Util::FeelLike, administrative.feel_like.class
      assert_equal 0, administrative.feel_like.value
      assert_equal :hum_index, administrative.feel_like.key

      assert_equal 'en-US', administrative.lang
      assert_equal 'en-CH', administrative.reg_locale
      assert_equal 'CH', administrative.country
    end
  end
end
