# frozen_string_literal: true

module Netatmo
  module Util
    class WifiStatus < EasyEnum::EasyEnum
      easy_enum bad: 0, average: 1, good: 2
    end
  end
end
