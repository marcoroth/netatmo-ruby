# frozen_string_literal: true

require 'netatmo/version'
require 'zeitwerk'
require 'easy_enum'

inflections = {
  'na_main' => 'NAMain',
  'na_module1' => 'NAModule1',
  'na_module2' => 'NAModule2',
  'na_module3' => 'NAModule3',
  'na_module4' => 'NAModule4',
  'co2' => 'CO2'
}

@loader = Zeitwerk::Loader.for_gem
@loader.inflector.inflect(inflections)
@loader.enable_reloading
@loader.setup

module Netatmo
  class Error < StandardError; end
end
