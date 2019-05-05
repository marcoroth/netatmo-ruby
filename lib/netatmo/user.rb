# frozen_string_literal: true

module Netatmo
  class User
    attr_accessor :mail
    attr_accessor :administrative

    def initialize(data)
      self.mail = data['mail']
      self.administrative = Netatmo::Administrative.new(data['administrative'])
    end
  end
end
