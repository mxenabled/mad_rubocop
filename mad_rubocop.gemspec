# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mad_rubocop/version"

Gem::Specification.new do |spec|
  spec.name          = "mad_rubocop"
  spec.version       = MadRubocop::VERSION
  spec.authors       = ["Zach Toolson"]
  spec.email         = ["zach.toolson@mx.com"]

  spec.summary       = "Wrapper for MX specific RuboCop settings. https://twitter.com/madrubocop"
  spec.description   = "Wrapper for MX specific RuboCop settings for managing custom settings across many projects."
  spec.homepage      = "https://github.com/mxenabled/mad_rubocop"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rubocop", "~> 0.38.0"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
