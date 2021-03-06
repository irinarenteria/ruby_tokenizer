# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_tokenizer/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_tokenizer"
  spec.version       = RubyTokenizer::VERSION
  spec.authors       = ["irinarenteria"]
  spec.email         = ["renteria.irina@gmail.com"]
  spec.description   = "RubyTokenizer is a simple language processing command-line tool. It performs low-level tokenization and returns the top 10 most frequent words in a body of text. At the moment it's only available for English texts and it segments words by filtering whitespaces, punctuation marks, parantheses and other special characters."
  spec.summary       = "Simple NPL tokenizer in Ruby"
  spec.homepage      = "https://github.com/irinarenteria/ruby_tokenizer"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables   = ["tokenizer"]
  spec.require_paths = ["lib"]
  spec.files = Dir['lib/**/*.rb']

  spec.add_dependency "pry", '~> 0'
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0"
  spec.add_development_dependency "aruba", "~>0.14.1"
end
