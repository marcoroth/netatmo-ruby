# frozen_string_literal: true

module Netatmo
  module DashboardData
    class Noise
      attr_accessor :time, :value, :unit

      def initialize(data)
        return if data.nil?

        self.time = Time.at(data['time_utc'])
        self.value = data['Noise'].to_f
        self.unit = 'dB'
      end

      def to_s
        "#{value} #{unit}"
      end

      def noise
        value
      end

      def status
        # TODO: calculate status (quiet/load/...)
      end
    end
  end
end
