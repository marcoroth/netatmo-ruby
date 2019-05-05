# frozen_string_literal: true

require 'forwardable'

module Netatmo
  module BatteryStatus
    class BatteryStatus
      extend Forwardable

      attr_accessor :type
      attr_accessor :value

      class << self
        attr_accessor :status_values
      end

      self.status_values = {}

      def initialize(value)
        self.value = value
      end

      def status
        self.class.status_values.each do |key, range|
          return Netatmo::Util::BatteryStatus.key(key) if range.cover? value
        end

        nil
      end

      def_delegators :status, :max?, :full?, :high?, :medium?, :low?, :very_low?
    end
  end
end
