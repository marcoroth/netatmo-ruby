# frozen_string_literal: true

require 'netatmo/version'
require 'netatmo_inflector'

require 'zeitwerk'
require 'byebug'
require 'dotenv'
require 'easy_enum'

Dotenv.load

@loader = Zeitwerk::Loader.for_gem
@loader.inflector = NetatmoInflector.new
@loader.enable_reloading
@loader.setup

module Netatmo
  class Error < StandardError; end
end
