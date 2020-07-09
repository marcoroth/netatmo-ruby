# frozen_string_literal: true

module Netatmo
  module DashboardData
    class CO2
      attr_accessor :time, :value, :unit

      def initialize(data)
        self.time = Time.at(data['time_utc'])
        self.value = data['CO2'].to_f
        self.unit = 'ppm'
      end

      def to_s
        "#{value} #{unit}"
      end

      def co2
        value
      end

      def status
        # TODO: calculate status
      end
    end
  end
end
