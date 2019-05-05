# frozen_string_literal: true

module Netatmo
  module Util
    class HealthIndex < EasyEnum::EasyEnum
      easy_enum healthy: 0, fine: 1, fair: 2, poor: 3, unhealthy: 4
    end
  end
end
