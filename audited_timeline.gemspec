# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'audited-timeline'
  spec.version       = File.read(File.expand_path('../VERSION', __FILE__)).strip
  spec.authors       = ['Raffael Schmid']
  spec.email         = ['raffael.schmid@nine.ch']
  spec.summary       = %q{Frontent to audited}
  spec.homepage      = 'https://github.com/ninech/audited-timeline'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
