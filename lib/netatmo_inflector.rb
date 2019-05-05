# frozen_string_literal: true

require 'zeitwerk'

class NetatmoInflector < Zeitwerk::Inflector
  def camelize(basename, _abspath)
    case basename
    when 'na_main'
      'NAMain'
    when 'na_module1'
      'NAModule1'
    when 'na_module2'
      'NAModule2'
    when 'na_module3'
      'NAModule3'
    when 'na_module4'
      'NAModule4'
    when 'co2'
      'CO2'
    else
      super
    end
  end
end
