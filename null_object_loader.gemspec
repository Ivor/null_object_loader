# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'null_object_loader/version'

Gem::Specification.new do |spec|
  spec.name          = "null_object_loader"
  spec.version       = NullObjectLoader::VERSION
  spec.authors       = ["Ivor Paul"]
  spec.email         = ["ivorpaul@gmail.com"]
  spec.description   = "Lets you specify what NullObject to instantiate instead of returning nil for instance methods."
  spec.summary       = "Loading null objects for instance methods."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
