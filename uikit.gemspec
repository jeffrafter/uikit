# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uikit/version'

Gem::Specification.new do |spec|
  spec.name          = "uikit"
  spec.version       = Uikit::VERSION
  spec.authors       = ["Jeff Rafter"]
  spec.email         = ["jeffrafter@gmail.com"]
  spec.description   = %q{Installs a basic set of user interface templates for your Rails application}
  spec.summary       = %q{Rails generator for installing user interface stylesheets}
  spec.homepage      = "https://github.com/jeffrafter/uikit"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
