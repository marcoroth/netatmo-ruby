# frozen_string_literal: true

module Netatmo
  module AirCare
    class HomeCoach < Netatmo::Weather::BaseStation
      attr_accessor :health_index

      # DeviceType: NHC
      def initialize(data)
        super(data)

        self.health_index = Netatmo::DashboardData::HealthIndex.new(data['dashboard_data'])
      end

      def name
        module_name
      end

      def data
        d = super
        d << health_index if health_index?
      end
    end
  end
end
