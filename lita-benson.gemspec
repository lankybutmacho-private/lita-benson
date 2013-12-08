Gem::Specification.new do |spec|
  spec.name          = "lita-benson"
  spec.version       = "0.0.9"
  spec.authors       = ["Matt Healy"]
  spec.email         = ["matt@matthewhealy.net"]
  spec.description   = %q{At your service.}
  spec.summary       = %q{Benson}
  spec.homepage      = "http://matthewhealy.net"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", "~> 2.6"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 2.14"
end
