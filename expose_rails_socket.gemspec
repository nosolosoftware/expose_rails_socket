lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'expose_rails_socket/version'

Gem::Specification.new do |spec|
  spec.name          = 'expose_rails_socket'
  spec.version       = ExposeRailsSocket::VERSION
  spec.authors       = ['Francisco Padillo']
  spec.email         = ['fpadillo@nosolosoftware.es']
  spec.summary       = 'Exposes easily remote command execution'
  spec.description   = 'Exposes easily remote command execution'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry-byebug'
end
