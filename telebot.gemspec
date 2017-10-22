# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "telebot/version"

Gem::Specification.new do |s|
  s.name          = "telebot"
  s.version       = Telebot::VERSION
  s.authors       = ["SumLare"]
  s.email         = ["anohin56@gmail.com"]

  s.summary       = %q{Telegram bot framework}
  s.description   = %q{Telebot is a framework made for programmer productivity in writing telegram bots}
  s.homepage      = "https://github.com/SumLare/telebot"
  s.license       = "MIT"

  s.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  s.bindir        = "exe"
  s.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.15"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"
end
