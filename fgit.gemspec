# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fgit/version'

Gem::Specification.new do |spec|
  spec.name          = "fgit"
  spec.version       = Fgit::VERSION
  spec.authors       = ["yan_runchen"]
  spec.email         = ["runchen.yan@drecom.co.jp"]

  spec.summary       = %q{extend git for file manipulating from branch to branch}
  spec.description   = %q{extend git for file manipulating from branch to branch}
  spec.homepage      = "https://github.com/SmileZero/fgit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'thor', '~> 0.18'
  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
