# frozen_string_literal: true

module Netatmo
  module DashboardData
    class Rain
      attr_accessor :time, :value, :sum_rain_1, :sum_rain_24

      def initialize(data)
        self.time = Time.at(data['time_utc'])
        self.value = data['Rain'].to_f
        self.sum_rain_1 = data['sum_rain_1'].to_f
        self.sum_rain_24 = data['sum_rain_24'].to_f
      end

      def to_s
        value
      end

      def rain
        value
      end

      def last_hour
        sum_rain_1
      end

      def last_day
        sum_rain_24
      end
    end
  end
end
