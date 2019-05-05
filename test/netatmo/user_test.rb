# frozen_string_literal: true

require 'test_helper'

module Netatmo
  class UserTest < Minitest::Test
    USER = {
      'mail' => 'test@example.org',
      'administrative' => {
        'country' => 'CH',
        'reg_locale' => 'en-CH',
        'lang' => 'en-US',
        'unit' => 0,
        'windunit' => 0,
        'pressureunit' => 0,
        'feel_like_algo' => 0
      }
    }.freeze

    def test_initialize
      user = Netatmo::User.new(USER)

      refute_nil user.administrative
      assert_equal 'test@example.org', user.mail
      assert_equal 'en-US', user.administrative.lang
      assert_equal 'en-CH', user.administrative.reg_locale
      assert_equal 'CH', user.administrative.country
      assert_equal Netatmo::Util::Unit.metric, user.administrative.unit
      assert_equal Netatmo::Util::Windunit.kph, user.administrative.windunit
      assert_equal Netatmo::Util::Pressureunit.mbar, user.administrative.pressureunit
      assert_equal Netatmo::Util::FeelLike.hum_index, user.administrative.feel_like
    end
  end
end
