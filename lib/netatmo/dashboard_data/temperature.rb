# frozen_string_literal: true

module Netatmo
  module DashboardData
    class Temperature
      attr_accessor :time
      attr_accessor :value
      attr_accessor :min
      attr_accessor :max
      attr_accessor :min_date
      attr_accessor :max_date
      attr_accessor :trend
      attr_accessor :unit

      def initialize(data)
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
