# frozen_string_literal: true

module Netatmo
  module Util
    class TempTrend < EasyEnum::EasyEnum
      easy_enum stable: 0, down: -1, up: 1
    end
  end
end
