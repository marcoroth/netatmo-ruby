# frozen_string_literal: true

module Netatmo
  module Util
    class Pressureunit < EasyEnum::EasyEnum
      easy_enum mbar: 0, inHg: 1, mmHg: 2
    end
  end
end
