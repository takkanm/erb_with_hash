# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'erb_with_hash/version'

Gem::Specification.new do |spec|
  spec.name          = "erb_with_hash"
  spec.version       = ERBWithHash::VERSION
  spec.authors       = ['Masatoshi Seki']
  spec.description   = 'Arrow Hash in ERB#result'
  spec.summary       = 'Arrow Hash in ERB#result'
  spec.homepage      = 'https://github.com/takkanm/erb_with_hash'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
