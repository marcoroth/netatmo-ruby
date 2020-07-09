# frozen_string_literal: true

require 'forwardable'

module Netatmo
  module DashboardData
    class Pressure
      extend Forwardable

      attr_accessor :time, :value, :absolute_pressure, :trend, :unit

      def initialize(data)
        self.time = Time.at(data['time_utc'])
        self.value = data['Pressure'].to_f
        self.absolute_pressure = data['AbsolutePressure'].to_f
        self.trend = Netatmo::Util::TempTrend.key(data['pressure_trend'].to_sym)
        self.unit = 'mbar'
      end

      def to_s
        "#{value} #{unit}"
      end

      def_delegators :trend, :stable?, :down?, :up?

      def pressure
        value
      end

      def abs
        absolute_pressure
      end

      def absolute
        absolute_pressure
      end
    end
  end
end
