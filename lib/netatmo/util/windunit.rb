# frozen_string_literal: true

module Netatmo
  module Util
    class Windunit < EasyEnum::EasyEnum
      easy_enum kph: 0, mph: 1, ms: 2, beaufort: 3, knot: 4
    end
  end
end
