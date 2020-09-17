# frozen_string_literal: true

module Netatmo
  module DashboardData
    class Temperature
      attr_accessor :time, :value, :min, :max, :min_date, :max_date, :trend, :unit

      def initialize(data)
        return if data.nil?

        self.time = Time.at(data['time_utc'])
        self.value = data['Temperature'].to_f
        self.min = data['min_temp'].to_f
        self.max = data['max_temp'].to_f
        self.min_date = Time.at(data['date_min_temp'])
        self.max_date = Time.at(data['date_max_temp'])
        self.trend = Netatmo::Util::TempTrend.key(data['temp_trend'].to_sym)
        self.unit = '°C'
      end

      def to_s
        "#{value} #{unit}"
      end

      def temperature
        value
      end
    end
  end
end
