# frozen_string_literal: true

module Netatmo
  module DashboardData
    class Wind
      attr_accessor :time, :wind_strength, :max_wind_strength, :max_wind_strength_date, :wind_angle, :gust_strength, :gust_angle, :wind_historic, :unit

      def initialize(data)
        return if data.nil?

        self.time = Time.at(data['time_utc'])
        self.wind_strength = data['WindStrength'].to_f
        self.max_wind_strength = data['max_wind_str'].to_f
        self.max_wind_strength_date = Time.at(data['date_max_wind_str'])
        self.wind_angle = data['WindAngle'].to_f
        self.gust_strength = data['Guststrength'].to_f
        self.gust_angle = data['GustAngle'].to_f
        self.wind_historic = data['WindHistoric']
        self.unit = 'km/h'
      end

      def to_s
        "#{wind_strength} #{unit}"
      end
    end
  end
end
