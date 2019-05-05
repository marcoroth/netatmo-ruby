# frozen_string_literal: true

module Netatmo
  module Util
    class DeviceType < EasyEnum::EasyEnum
      easy_enum base_station: 'NAMain',
                outdoor_module: 'NAModule1',
                wind_gauge: 'NAModule2',
                rain_gauge: 'NAModule3',
                indoor_module: 'NAModule4',
                health_coach: 'NHC'
    end
  end
end
