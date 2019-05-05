# frozen_string_literal: true

module Netatmo
  module Util
    class BatteryStatus < EasyEnum::EasyEnum
      easy_enum max: 0, full: 1, high: 2, medium: 3, low: 4, very_low: 5
    end
  end
end
