# frozen_string_literal: true

require 'forwardable'

module Netatmo
  module Weather
    class WifiStatus
      extend Forwardable

      attr_accessor :value

      def initialize(value)
        self.value = value
      end

      def to_s
        status.to_s
      end

      def status
        case value
        when 0..56
          Netatmo::Util::WifiStatus.good
        when 57..71
          Netatmo::Util::WifiStatus.average
        when value > 72
          Netatmo::Util::WifiStatus.bad
        end
      end

      def_delegators :status, :good?, :average?, :bad?
    end
  end
end
