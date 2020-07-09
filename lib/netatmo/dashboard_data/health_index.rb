# frozen_string_literal: true

require 'forwardable'

module Netatmo
  module DashboardData
    class HealthIndex
      extend Forwardable

      attr_accessor :time, :value, :unit

      def initialize(data)
        self.time = Time.at(data['time_utc'])
        self.value = data['health_idx'].to_i
      end

      def status
        Netatmo::Util::HealthIndex.value(value)
      end

      def_delegators :status, :healthy?, :fine?, :fair?, :poor?, :unhealthy?

      def health_idx
        value
      end

      def health_index
        value
      end
    end
  end
end
