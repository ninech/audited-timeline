# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'audited-timeline'
  spec.version       = ENV.fetch("GEM_VERSION", [`git describe --tags --abbrev=0`, `git rev-parse --short HEAD`].map(&:chomp).join(".")).delete_prefix("v")
  spec.authors       = ['Nine Internet Solutions AG']
  spec.email         = ['support@nine.ch']
  spec.summary       = 'Frontent to audited'
  spec.homepage      = 'https://github.com/ninech/audited-timeline'
  spec.license       = 'MIT'
  spec.description   = 'audited-timeline provides timeline frontend to audited'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler"

  spec.add_runtime_dependency 'audited', '>= 4.0'
  spec.add_runtime_dependency 'rails', '>= 4.0.0'
  spec.add_runtime_dependency 'draper', '>= 2.1.0'
end
