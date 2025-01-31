# frozen_string_literal: true

require_relative "lib/rustywind/ruby/version"

Gem::Specification.new do |spec|
  spec.name = "rustywind-ruby"
  spec.version = Rustywind::Ruby::VERSION
  spec.authors = ["Mark Hesketh"]
  spec.email = ["contact@markhesketh.co.uk"]

  spec.summary = "Ruby wrapper for rustywind"
  spec.description = "A Ruby wrapper for rustywind, a CLI utility for sorting Tailwind CSS classes"
  spec.homepage = "https://github.com/markahesketh/rustywind-ruby"
  spec.license = "MIT"
  spec.files = Dir["lib/**/*", "LICENSE.txt", "LICENSE-DEPENDENCIES", "README.md"]
  spec.required_ruby_version = ">= 3.1.0"

  spec.bindir = "exe"
  spec.executables << "rustywind"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rubyzip", "~> 2.3"
  spec.add_development_dependency "standard", "~> 1.31"
end
