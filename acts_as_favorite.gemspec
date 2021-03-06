# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acts_as_favorite/version'

Gem::Specification.new do |spec|
  spec.name          = "acts_as_favourites"
  spec.version       = Favorable::VERSION
  spec.authors       = ["Rajarshi Das"]
  spec.email         = ["rajarshi2576@gmail.com"]
  spec.summary       = %q{Add favorite feature to any Active Record models}
  spec.homepage      = "https://github.com/rajcybage/acts_as_favourites"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "generator_spec"
  spec.add_development_dependency "coveralls"
end
