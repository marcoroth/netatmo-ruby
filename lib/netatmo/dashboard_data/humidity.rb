# frozen_string_literal: true

module Netatmo
  module DashboardData
    class Humidity
      attr_accessor :time
      attr_accessor :value
      attr_accessor :unit

      def initialize(data)
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
