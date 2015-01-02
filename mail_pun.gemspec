# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mail_pun/version'

Gem::Specification.new do |spec|
  spec.name          = "mail_pun"
  spec.version       = MailPun::VERSION
  spec.authors       = ["Balazs Kutil"]
  spec.email         = ["balazs@kutilovi.cz"]
  spec.summary       = %q{Email address generator.}
  spec.description   = %q{Generate email addresses that cover various part of the RFCs.}
  spec.homepage      = "https://github.com/bkutil/mail_pun"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
