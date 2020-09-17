# frozen_string_literal: true

module Netatmo
  module DashboardData
    class Humidity
      attr_accessor :time, :value, :unit

      def initialize(data)
        return if data.nil?

        self.time = Time.at(data['time_utc'])
        self.value = data['Humidity'].to_f
        self.unit = '%'
      end

      def to_s
        "#{value}#{unit}"
      end

      def humidity
        value
      end

      def status
        # TODO: calculate status (green/yellow/red)
      end
    end
  end
end
