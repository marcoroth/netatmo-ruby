# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'netatmo/version'

Gem::Specification.new do |s|
  s.name          = 'netatmo'
  s.version       = Netatmo::VERSION
  s.authors       = ['Marco Roth']
  s.email         = ['marco.roth@intergga.ch']
  s.summary       = 'Netatmo Ruby Client'
  s.description   = 'Ruby Wrapper for the Netatmo HTTP API'
  s.homepage      = 'https://github.com/marcoroth/netatmo-ruby'
  s.license       = 'MIT'
  s.files         = Dir['{lib}/**/*', 'LICENSE.txt', 'README.md']
  s.bindir        = 'exe'
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.metadata      = { 'github_repo' => 'https://github.com/marcoroth/netatmo-ruby' }

  s.add_dependency 'easy_enum', '~> 0.1'
  s.add_dependency 'faraday', '~> 1.0'
  s.add_dependency 'geocoder', '~> 1.6'
  s.add_dependency 'zeitwerk', '~> 2.2'

  s.add_development_dependency 'bundler', '~> 2.0'
  s.add_development_dependency 'byebug', '~> 11.0'
  s.add_development_dependency 'dotenv', '~> 2.0'
  s.add_development_dependency 'minitest', '~> 5.0'
  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rubocop', '~> 0.79'
end
