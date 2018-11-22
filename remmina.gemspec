# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'remmina/version'

Gem::Specification.new do |spec|
  spec.name          = "remmina"
  spec.version       = Remmina::VERSION
  spec.authors       = ["Vlatko Kosturjak"]
  spec.email         = ["vlatko.kosturjak@gmail.com"]

  spec.summary       = %q{Ruby support for Remmina.}
  spec.description   = %q{Ruby support classes for Remmina}
  spec.homepage      = "https://github.com/kost/remmina-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "> 0"
end
