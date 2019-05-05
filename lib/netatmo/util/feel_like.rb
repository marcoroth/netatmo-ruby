# frozen_string_literal: true

module Netatmo
  module Util
    class FeelLike < EasyEnum::EasyEnum
      easy_enum hum_index: 0, heat_index: 1
    end
  end
end
