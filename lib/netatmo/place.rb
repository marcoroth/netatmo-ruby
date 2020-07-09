# frozen_string_literal: true

require 'geocoder'

module Netatmo
  class Place
    attr_accessor :altitude, :city, :country, :location, :timezone

    def initialize(data)
      self.altitude = data['altitude']
      self.city = data['city']
      self.country = data['country']
      self.timezone = data['timezone']
      self.location = ::Geocoder.search(data['location'].reverse)
    end
  end
end
