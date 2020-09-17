# frozen_string_literal: true

module Netatmo
  module Weather
    class StationData
      attr_accessor :user, :devices

      def initialize(response)
        self.devices = []

        response['devices'].each do |device|
          devices << Device.parse(device)
        end

        self.user = Netatmo::User.new(response['user'])
      end
    end
  end
end
