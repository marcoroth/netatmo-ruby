# frozen_string_literal: true

module Netatmo
  module Util
    class Unit < EasyEnum::EasyEnum
      easy_enum metric: 0, imperial: 1
    end
  end
end
