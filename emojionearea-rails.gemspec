# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'emojionearea/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "emojionearea-rails"
  spec.version       = Emojionearea::Rails::VERSION
  spec.authors       = ["Lucius Choi"]
  spec.email         = ["lucius.choi@gmail.com"]

  spec.summary       = %q{emojionearea jquery plugin for Rails asset pipeline.}
  spec.description   = %q{WYSIWYG-like EmojiOne Converter / Picker Plugin for jQuery}
  spec.homepage      = "https://github.com/luciuschoi/emojionearea-rails"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = Dir["{lib,vendor}/**/*"] + ["LICENSE.txt", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency 'rumoji', "~> 0.5.0"
  spec.add_runtime_dependency 'gemoji', "~> 3.0.0"
  spec.add_runtime_dependency 'gemojione', '~> 3.3.0'

end
